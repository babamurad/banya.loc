<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Employe;
use App\Models\JobTitle;
use App\Models\Order;
use App\Models\OrderDetail;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class OrderCreate extends Component
{
    public $first_name, $last_name, $phone, $Address;
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id;
    public $searchClient, $clients_id;
    public $data;
    public $employe_id, $job_id, $qty, $sum, $price;
    public $jobEnabled = 'disabled';

    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $startOrder, $endOrder;

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
        $time_list = DB::select('CALL procTimeList("'.$this->department_id.'", "'.$this->data . '")');
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
            $details = OrderDetail::where('order_id', $this->num)->get();
            $order = Order::where('num', $this->num)->get();
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

//        $time_list = DB::select('CALL procTimeList("'.$this->department_id.'", "'.$this->data . '")');
//        $this->startOrder = $time_list[0]->time;

        $this->job_id = $jobtitles->id;
        $this->price = $jobtitles->price;
        $this->sum = $jobtitles->sum;

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

        //dd($order->jsum);
        session()->flash('success', 'Заказ сохранен.');
        $this->jobEnabled = 'enabled';
        $this->order_id = $order->id;
    }

    public function addOrderJob()
    {
        //dd($this->job_id);
        $jname = JobTitle::find($this->job_id);
        $detail = new OrderDetail();
        $detail->num = $this->num;
        $detail->name = $jname->name;
        $detail->order_id = $this->order_id;
        $detail->jobtitle_id = $this->job_id;
        $detail->employes_id = $this->employe_id;
        $detail->qty = $this->qty;
        $detail->price = $this->price;
        $detail->sum = $this->sum;
        $detail->save();
        $this->dispatch('closeJobTitleModal');
        session()->flash('success', 'Добавлен вид услуг.');
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
        $order = Order::findOrFail($this->num);
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

    public function timeDiff()
    {
        //dd($this->startOrder.'-'.$this->endOrder);

        $tm =  DB::select('call procTimeDiff("'.$this->num.'")');


        //dd($tm[0]->tDiff*25);
    }

    public function EditOrderJob()
    {

    }
}
