<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Employe;
use App\Models\JobTitle;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\TimeTb;
use Carbon\Carbon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use function Laravel\Prompts\table;

class OrderCreate extends Component
{
    public $first_name, $last_name, $phone, $Address;
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id;
    public $searchClient;
    public $clients_id = '';
    public $data;
    public $employe_id, $job_id, $qty, $sum, $price;
    public $jobEnabled = 'disabled';

    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $startOrder, $endOrder;
    public $details_sum;

    protected $rules = [
        'first_name' => 'required|min:3',
        'phone' => 'required',
    ];


    public function render()
    {
        if (strlen($this->searchClient) <= 1)
        {
            $clients = Client::orderBy('first_name', 'ASC')->get();
            //orderBy('first_name', 'ASC')->get();
        } else
        {
            $clients = Client::
            where('first_name', 'like', '%'.$this->searchClient.'%')->
            orwhere('last_name', 'like', '%'.$this->searchClient.'%')->
            get();
        }
        $employes = Employe::all();
        //$time_list = DB::select('CALL procTimeList("'.$this->department_id.'", "'.$this->data . '")');
        $time_list = TimeTb::all();//where('busy', '=', 0)->get();
        //dd($time_list[0]->time);
        $dep_name = Department::findOrFail($this->department_id);
        $dep_name = $dep_name->name;

        $departments = Department::all();

        if ($this->employe_id){
            $jobtitles = JobTitle::where('employe_id', $this->employe_id)->get();
        } else {
            $jobtitles = JobTitle::all();
        }

        if ($this->job_id){
            $selJob = JobTitle::where('id', $this->job_id)->first();
            $this->price = $selJob->price;
            $this->sum = $selJob->sum;
        }

        if ($this->num){
            $details = OrderDetail::with('order')->with('employe')->where('order_id', $this->num)->get();
            $order = Order::with('order_details')->where('num', $this->num)->get();
            //dd($order[0]->start);
            $this->startOrder = $order[0]->start;
            $this->endOrder = $order[0]->end;

        } else {
            $details = '';
        }

        return view('livewire.order-create',
            compact('clients', 'time_list', 'dep_name', 'departments', 'employes', 'jobtitles', 'details')
        );
    }

    public function mount($data, $dep_id, $number)
    {
        $this->num = $number;

        if ($data == null) {
            $data = Carbon::create(now())->format('Y-m-d');
        } else {
            $data = Carbon::create($data)->format('Y-m-d');
        }

        if (session()->get('client')){
            $this->clients_id = session()->get('client');
        }

        //$order = DB::select('SELECT * FROM orders ORDER BY id DESC LIMIT 0, 1'); $order[0]->id;

        $this->data = $data;

        $this->department_id = $dep_id ? $dep_id : 1;
        $department_id = Department::findOrFail($this->department_id);

        $this->depart_id = $department_id->id;
        $this->jprice = $department_id->price;

        $employe = Employe::first();
        $this->employe_id = $employe->id;
        $jobtitles = JobTitle::first();

        $department = Department::findOrFail($this->department_id);
        $this->jprice = $department->price;

        $order_qty = DB::select('call procTimeDiff("'.$this->num.'")');
        $this->jqty = $order_qty[0]->tDiff;

        $this->jsum = $this->jprice * $this->jqty;

        $this->details_sum = OrderDetail::where('order_id', $this->num)->sum(DB::raw('qty * price'));
        //dd($this->details_sum);

        $this->job_id = $jobtitles->id;
        $this->price = $jobtitles->price;
        $this->sum = $jobtitles->sum;

    }

    public function updatedСlients_id()
    {
        //dd($this->clients_id);
        if ($this->clients_id) {
            dd($this->clients_id);
            session()->put('client', $this->clients_id);
        }
        if (session()->get('client')){
            dd($this->clients_id);
            $this->clients_id = session()->get('client');
        }

    }

    public function SaveOrder()
    {
        $this->validate([
            'num' => 'required',
            'data' => 'required',
            'department_id' => 'required',
            //'clients_id' => 'required',
        ]);

        if (!$this->clients_id)
        {
            session()->flash('error', 'Выберите клиента');
            return;
        }
        if ($this->clients_id) {
            //dd($this->clients_id);
            session()->put('client', $this->clients_id);
        }
        //dd($this->startOrder.'-'.$this->endOrder);
        $order = Order::findOrFail($this->num);
        $order->num = $this->num;
        $order->data = $this->data;
        $order->department_id = $this->department_id;
        $order->clients_id = $this->clients_id;
        $order->user_id = 22;
        $order->start = $this->startOrder;
        $order->end = $this->endOrder;

        //$jqty, $jprice, $jsum
        $order_qty = DB::select('call procTimeDiff("'.$this->num.'")');
        $this->jqty = $order_qty[0]->tDiff;
        $this->jsum = $this->jqty * $this->jprice;
        $order->sum = $this->jsum;

        $order->save();

        session()->flash('success', 'Заказ сохранен.');
        $this->jobEnabled = 'enabled';
        $this->order_id = $order->id;
    }

    public function addOrderJob()
    {
        if ($this->num){
            //dd($this->num);
            $jname = JobTitle::find($this->job_id);
            $detail = new OrderDetail();
            $detail->num = $this->num;
            $detail->name = $jname->name;
            $detail->order_id = $this->num;
            $detail->jobtitle_id = $this->job_id;
            $detail->employes_id = $this->employe_id;
            $detail->qty = $this->qty;
            $detail->price = $this->price;
            $detail->sum = $this->qty * $this->price;
            $detail->save();
            $this->dispatch('closeJobTitleModal');
            session()->flash('success', 'Добавлен вид услуг.');
        } else {
            session()->flash('error', 'Сначачала сохраните заказ');
            return;
        }

    }

    public function updatedQty()
    {
        if (is_numeric($this->price) && is_numeric($this->qty))
        {
            //dd($this->qty*$this->price);
            $this->sum = $this->qty * $this->price;

        }
    }

    public function updatedJqty()
    {
//        dd($this->jqty);
//        $this->jsum = $this->jqty * $this->jprice;
    }

    public function updatedDepart_id()
    {
        dd('departments updated');
        $department = Department::findOrFail($this->department_id);
        $this->jprice = $department->price;
        //dd($this->jprice);
        //depart_id
    }

    public function updatedEmploye_id()
    {
        if (is_numeric($this->price) && is_numeric($this->qty))
        {
            //dd($this->qty*$this->price);
            $this->sum = $this->qty * $this->price;

        }
    }

    public function updatedJob_id()
    {
        if (is_numeric($this->price) && is_numeric($this->qty))
        {
            $this->sum = $this->qty * $this->price;

        }
    }

    public function updatedStartOrder()
    {
        //dd($this->num);
        $order = Order::where('num', '=', $this->num)->first();
        //dd($order->num);
        $order->start = $this->startOrder;
        $order->end = $this->endOrder;
        $order->save();
        //dd($this->num);
        //dd($this->endOrder);
        $order_qty = DB::select('call procTimeDiff("'.$this->num.'")');
        $this->jqty = $order_qty[0]->tDiff;
        $this->jsum = $this->jprice * $this->jqty;
        //dd($this->jprice);
        //dd($order_qty);
    }

    public function updatedEndOrder()
    {
        $this->updatedStartOrder();
    }

    public function SaveClient()
    {
        $this->validate();

        $client = new Client();
        $client->first_name = $this->first_name;
        $client->last_name = $this->last_name? $this->last_name: '';
        $client->phone = $this->phone ? $this->phone : 0;
        $client->address = $this->Address ? $this->Address : '';
        $client->save();
        $this->dispatch('closeModal');
//        $this->ResetInputFields();
        session()->flash('success', 'Client has been added!');
    }

    public function ResetInputFields()
    {
        $this->first_name = '';
        $this->last_name = '';
        $this->phone = '';
        $this->address = '';
    }

    public function selectClient($id)
    {
        $this->clients_id = $id;
        $this->searchClient = '';
    }

    public function storeOrderJob($id, $name, $qty, $price)
    {
        Cart::instance('jobs')->add($id, $name, $qty, $price)->associate('App\Models\OrderDetail');
        $this->dispatch('closeJobTitleModal');
    }

}
