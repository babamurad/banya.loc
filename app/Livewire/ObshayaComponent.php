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
    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum, $job;
    //For Order Details
    public $employe_id, $job_id, $qty, $sum, $price;
    public $details_sum;
    public $visOrder = true;
    public $qtyAdults = 1, $qtyChildren = 0;
    public $jobs = [];
    public $gender;
    public $order;
    public $details;
    public $edit_id = '';
    public $date1, $date2;
    protected $listeners = ['updateDate' => 'setDate'];

    public function render()
    {
        $employes = Employe::all();
        $time_list = TimeTb::all();
        //$mans = Order::where('gender', '=', 1)->count();
        //$womans = Order::where('gender', '=', 2)->count();
        $kol = DB::select('SELECT SUM(CASE WHEN o.gender=1 THEN 1 END) AS mans, SUM(CASE WHEN o.gender=2 THEN 1 END) AS womans FROM orders o')[0];
        //dd($kol->mans);
        if ($this->employe_id) {
            $jobtitles = JobTitle::where('employe_id', $this->employe_id)->get();
        } else {
            $jobtitles = JobTitle::all();
        }

        if ($this->order) {
            $this->details = OrderDetail::with('order')
                ->with('employe')
                ->where('order_id', $this->order->id)
                ->get();
        }
            //$orders = Order::with('order_details')->orderBy('id', 'DESC')->paginate(10);
            $orders_query = Order::query();

            if ($this->gender) {
                $orders_query->where('gender', '=', $this->gender);
            }

            // Обновление фильтра по дате
            if ($this->date1 && $this->date2) {
                $orders_query->whereBetween('data', [$this->FormatDate($this->date1), $this->FormatDate($this->date2)]);
            }

            $orders = $orders_query
                ->with('order_details')
                ->orderBy('id', 'DESC')
                ->paginate(10);


        return view('livewire.obshaya-component', compact('time_list', 'employes', 'jobtitles', 'orders', 'kol'));
    }

    public function mount()
    {
        $employe = Employe::first();
        $this->employe_id = $employe->id;
        $this->job = JobTitle:: where('employe_id', $this->employe_id)->get();

        //$this->date1 = Carbon::create(now())->format(('d.m.Y'));
        //$this->date2 = Carbon::create(now())->format(('d.m.Y'));
    }

    public function updatedDate1($newDate)
    {
        $this->date1 = $newDate;
        $this->dispatch('date1Updated', $newDate);
        dd('Date changed');
        // ... perform any additional actions needed after date update
    }

    public function FormatDate($data) {
        //
        //$oldDateFormat = $data . ' 06:00:00 Europe/Moscow';
        //dd($oldDateFormat);
        //$newDateFormat = 'Y-m-d H:i:s';
        $newDate = Carbon::create($data)->format('Y-m-d');
        return $newDate;
    }


    public function addOrder()
    {
        $this->toggleNewOrder();
        //create number for new order num + 1
        $numb = Order::latest()->first();
        $this->num = $numb->num;

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

    public function editOrder($id)
    {
        $this->edit_id = $id;
        $order = Order::findOrFail($this->edit_id);
                 
                 $this->department_id = $order->department_id ;
                // $cl_id = Client::select('id')->first();
                //  $cl_id->id = $order->clients_id ;
                 $this->qty = $order->qty;
                 $this->qtyAdults = $order->adults ;
                 $this->qtyChildren = $order->children ;
                 $this->startOrder = $order->start ;
                 $this->endOrder = $order->end ;
                 $this->sum = $order->sum ;
                 $this->pol = $order->gender ;
        $this->toggleNewOrder();
    }

    public function saveOrder()
    {
        if( $this->edit_id){
            if ($this->sum > 0) {
                $order = Order::findOrFail($this->edit_id);
                //$order->num = $this->num;
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
                $order->update();
                session()->flash('success', 'Сохранено');
                //$this->toggleNewOrder();
                $this->order = $order;
                $this->closeForm();
            } else {
                session()->flash('error', 'Сумма не может быть 0. Проверьте время заказа');
        }            
        } else {
            $numb = Order::latest()->first();
            $this->num = $numb->num+1;
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
            //$this->toggleNewOrder();
            $this->order = $order;
            $this->closeForm();
        } else {
            session()->flash('error', 'Сумма не может быть 0. Проверьте время заказа');
        }
        }
        
    }

    public function closeForm()
    {
        $this->toggleNewOrder();
        $this->reset('num', 'department_id', 'clients_id', 'sum', 'qty', 'qtyChildren');
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

    public function addOrderJob():void
    {

        if ($this->order) {
            $detail = new OrderDetail();
            $detail->num = $this->order->num;

            $detail->name = $this->job->name;
            $detail->order_id = $this->order->id;
            $detail->jobtitle_id = $this->job_id;
            $detail->employes_id = $this->employe_id;
            $detail->qty = $this->jqty;
            $detail->price = $this->jprice;
            $detail->sum = $this->details_sum;
            $detail->save();
            $this->dispatch('closeJobTitleModal');
            session()->flash('success', 'Добавлен вид услуг.');
        } else {
            session()->flash('error', 'Сначала сохраните заказ');
            return;
        }
        $this->details_sum = OrderDetail::where('order_id', $this->num)->sum(DB::raw('qty * price'));
        return;
    }

    public function updatedJqty()
    {
        //$employe_id, $job_id, $qty, $sum, $price;
        $this->details_sum = number_format($this->jqty * $this->jprice, 2, ',', ' ');
    }

    public function updatedJobId()
    {
        $this->job = JobTitle::where('employe_id', $this->employe_id)->where('id', $this->job_id)->first();
        $this->jprice = $this->job->price;

    }

    public function updatedEmployeId()
    {
        $this->job = JobTitle::where('employe_id', $this->employe_id)->first();
        $this->jprice = $this->job->price;
    }

    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        $order->delete();
        session()->flash('error', 'Зааказ был удален!');
    }
}
