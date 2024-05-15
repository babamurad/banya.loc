<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Employe;
use App\Models\JobTitle;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\TimeTb;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class ObshayaComponent extends Component
{
    //Использую Livewire, laravel связанные таблицы, в подчиненной таблице может быть несколько записей,
    // нужно сделать добавление, удаление и редактирование. В главной таблице есть поля: num, title, start_date, end_date.
    // В подчиненной есть такие поля: name, quantity, price, sum, description. Нужно сделать все в одном компоненте,
    // нужно использовать массив для подчиненной таблицы. Нужно использовать DB::beginTransaction();
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id, $clients_id, $pol = 1;
    public $startOrder = "06:00:00", $endOrder;
    //Sprawocniki kazhetsya
    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    //For Order Details
    public $employe_id, $job_id, $qty, $sum, $price;
    public $details_sum;
    public $visOrder = true;
    public $qtyAdults = 1, $qtyChildren = 0;
    public $jobs = [];
    public $gender;

    public function render()
    {
        $employes = Employe::all();
        $time_list = TimeTb::all();
        $mans = Order::where('gender', '=', 1)->count();
        $womans = Order::where('gender', '=', 2)->count();
        if ($this->employe_id) {
            $jobtitles = JobTitle::where('employe_id', $this->employe_id)->get();
        } else {
            $jobtitles = JobTitle::all();
        }
//        if ($this->num) {
            $details = OrderDetail::with('order')
                ->with('employe')
                ->where('order_id', $this->num)
                ->get();
            //$orders = Order::with('order_details')->orderBy('id', 'DESC')->paginate(10);
            $orders_query = Order::query();
            if ($this->gender) { $orders_query->where('gender', '=', $this->gender); }
            $orders = $orders_query
                ->with('order_details')
                ->orderBy('id', 'DESC')
                ->paginate(10);


        return view('livewire.obshaya-component', compact('time_list', 'employes', 'jobtitles', 'details', 'orders', 'mans', 'womans'));
    }

    public function addOrder()
    {
        $this->toggleNewOrder();
        //create number for new order num + 1
        $numb = DB::select('call procNewNumber()');
        $this->num = $numb[0]->Number;

        DB::beginTransaction();

        try {

            $order = new Order();
            $order->num = $this->num;
            $order->clients_id = $this->clients_id;
            $order->data = $this->order_data;
            $order->employes_id = $this->employe_id;
            $order->department_id = $this->department_id;
            $order->sum = $this->sum ? : 0;
            $order->save();

        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['message' => 'Произошла ошибка при создании заказа: ' . $e->getMessage()], 500);
        }

        //$employe_id, $job_id, $qty, $sum, $price
        session()->flash('success', 'Новый заказ создан');
    }

    public function cancelOrder()
    {
        DB::rollBack();
        $this->visOrder = !$this->visOrder;
    }

    public function saveOrder()
    {
        $numb = DB::select('call procNewNumber()');
        $this->num = $numb[0]->Number;
        if ($this->sum > 0) {
            $order = new Order();
            $order->num = $this->num;

            $order->data = Carbon::create(now());
            $order->department_id = $this->department_id;
            $cl_id = Client::select('id')->first();
            $order->clients_id = $cl_id->id;
            $order->employes_id = 3;
            $order->adults = $this->qtyAdults;
            $order->children = $this->qtyChildren;
            $order->start = $this->startOrder;
            $order->end = $this->endOrder;
            $order->sum = $this->sum;
            $order->gender = $this->pol;
            $order->save();
            session()->flash('success', 'Сохранено');
            $this->toggleNewOrder();
            $this->reset('num', 'department_id', 'clients_id', 'sum', 'qty');
        } else {
            session()->flash('error', 'Сумма не может быть 0. Проверьте время заказа');
        }


            //
    }

    public function toggleNewOrder()
    {
        $this->visOrder = !$this->visOrder;
    }

    public function updatedEndOrder()
    {
        $t1 = strtotime($this->startOrder);
        $t2 =  strtotime($this->endOrder);
        $this->qty = ($t2 - $t1) / 3600;
        if ($this->qty < 0) {
            $this->qty = 0;
        }

        $this->sum = $this->qtyAdults * 70 * $this->qty + $this->qtyChildren * 30 * $this->qty;
        if ($this->sum < 0) {
            $this->sum = 0;
        }

    }

    public function updatedqtyAdults()
    {
        $this->updatedEndOrder();
    }
    public function updatedqtyChildren()
    {
        $this->updatedEndOrder();
    }

    public function addOrderJob()
    {
        if ($this->num) {
            $jname = JobTitle::find($this->job_id);
            $detail = new OrderDetail();
            $detail->num = $this->num;
            $detail->name = $jname->name;
            $detail->order_id = $this->num;
            $detail->jobtitle_id = $this->job_id;
            $detail->employes_id = $this->employe_id;
            $detail->qty = $this->qty;
            $detail->price = $this->price;
            $detail->sum = number_format($this->qty * $this->price, 2, 2);
            $detail->save();
            $this->dispatch('closeJobTitleModal');
            session()->flash('success', 'Добавлен вид услуг.');
        } else {
            session()->flash('error', 'Сначала сохраните заказ');
            return;
        }
        $this->details_sum = OrderDetail::where('order_id', $this->num)->sum(DB::raw('qty * price'));
    }
}
