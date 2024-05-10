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

class ObshayaComponent extends Component
{
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id, $clients_id;
    public $startOrder = "06:00", $endOrder;
    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $employe_id, $job_id, $qty, $sum, $price;
    public $details_sum;
    public $visOrder = true;
    public $qtyAdults = 1, $qtyChildren = 0;

    public function render()
    {
        $employes = Employe::all();
        $time_list = TimeTb::all();
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
            $order = Order::with('order_details')->where('num', $this->num)->get();
            //dd($order[0]->start);
            //$this->startOrder = $order[0]->start;
            //$this->endOrder = $order[0]->end;
//        } else {
//            $details = '';
//        }
        return view('livewire.obshaya-component', compact('time_list', 'employes', 'jobtitles', 'details'));
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

        if (!$this->order_id == null || $this->sum != 0 || $this->sum != null) {

            if (!$this->order_id) {
                $order = new Order();
                $save = true;} else {
                $order = Order::findOrFail($this->order_id);
                $save = false;
            }

            $order->num = $this->num;

            $order->data = Carbon::create(now());
            $order->department_id = $this->department_id;
            $cl_id = Client::select('id')->first();
            $order->clients_id = $cl_id->id;
            $order->employes_id = 3;
            $order->sum = $this->sum;

            if ($save) {
                $order->save();
            } else {
                $order->update();
            }
            session()->flash('success', 'Сохранено');
        } else {
            session()->flash('error', 'Сумма не может быть 0');
        }
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

        $this->sum = $this->qtyAdults * 70 * $this->qty + $this->qtyChildren * 30 * $this->qty;

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
