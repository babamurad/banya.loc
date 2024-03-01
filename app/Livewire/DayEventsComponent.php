<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Order;
use App\Models\TimeTb;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\Attributes\On;

class DayEventsComponent extends Component
{
    public $startTime, $endTime;
    public $data, $year, $month, $mon;
    public $title, $vis = false;
    public $weekString = ['Понедельник', 'Вторник','Среда','Четверг','Пятница','Суббота','Воскресенье'];
    public $monthStr = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
    public $daysM = [];
    public $clients = [];
    public $tb_times =[], $time_list = [];


    public $clients_id, $orderClient;
    public $order_data, $order_num, $employes_id, $client_is, $department_id, $total_sum, $desc;
    public $start, $end, $qty, $price, $sum;
    public $first_name, $last_name, $phone, $Address;
    public $num;

    protected $rules = [
        'first_name' => 'required|min:3',
        'phone' => 'required',
    ];

    public function render()
    {
        $date = $this->year . '/'. $this->mon . '/' . '01';
        $this->htmlCalendar = $this->calendar($date);

        $clients = Client::orderBy('first_name')->get()->toArray();
        $this->clients_array = Client::orderBy('first_name')->get()->toArray();

        $departments = Department::orderBy('id')->get();
        $users = User::where('post_id', '=', 1)->get();
        return view('livewire.day-events-component', compact('clients', 'departments', 'users'));
    }

    public function mount()
    {
        $now = Carbon::now();
        $this->year = $now->year;
        $this->month = $now->month;
        $this->mon = $now->month;
        $this->data = Carbon::create($now)->format('d.m.Y');

        $this->startCalendar = $now->copy()->firstOfMonth()->startOfWeek(Carbon::MONDAY);
        $this->endCalendar = $now->copy()->lastOfMonth()->endOfWeek(Carbon::SUNDAY);

        $this->calendar($this->data);
        $this->viewDay($this->data);
        $this->department_id = Department::first()->id;
    }

    #[On('client-create')]
    public function updateClient()
    {

    }

    public function vcheck()
    {
        $this->vis = !$this->vis;
    }

    public function calendar($date = null)
    {
        $date = empty($date) ? Carbon::now() : Carbon::createFromDate($date);
        $startOfCalendar = $date->copy()->firstOfMonth()->startOfWeek(Carbon::MONDAY);
        $endOfCalendar = $date->copy()->lastOfMonth()->endOfWeek(Carbon::SUNDAY);

        $html = '<div class="calendar">';

        $html .= '<div class="month-year">';
        $html .= '<span class="month">' . $date->format('M') . '</span>';
        $html .= '<span class="year">' . $date->format('Y') . '</span>';
        $html .= '</div>';

        $html .= '<div class="days">';

        $dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        foreach ($dayLabels as $dayLabel)
        {
            $html .= '<span class="day-label">' . $dayLabel . '</span>';
        }
        $this->daysM = [];
        while($startOfCalendar <= $endOfCalendar)
        {
            $extraClass = $startOfCalendar->format('m') != $date->format('m') ? 'dull' : '';
            $extraClass .= $startOfCalendar->isToday() ? ' today' : '';

            $html .= '<span class="day '.$extraClass.'"><span class="content">' . $startOfCalendar->format('j') . '</span></span>';
            $this->daysM[] = $startOfCalendar->format('d.m.Y');
            $startOfCalendar->addDay();
        }
        $html .= '</div></div>';
        //dd($this->daysM);
        return  $this->daysM; //$html;
    }

    public function viewDay($day)
    {
        $this->data = Carbon::create($day)->format('d.m.Y 00:00:00');

        $today = Carbon::create($this->data)->format('Y-m-d 00:00:00');
        $tomorrow = Carbon::create($this->data)->format('Y-m-d 23:59:59');

        $data = Carbon::create($this->data)->format('Y-m-d');
        $this->department_id = $this->department_id ? $this->department_id : 1;
        //Это ХП в БД переводит время с таблицы заказов в таблицу времени TimeTb для отображения
        DB::select('CALL procGetOrderTime("'.$data.'", "'.$this->department_id.'")');
        $this->tb_times = TimeTb::all()->toArray();
        $this->DepartmentChecked();

    }

    public function AddBooking()
    {
        //dd($this->clients_id);
        //dd($this->data);

    }

    public function DepartmentChecked()
    {
        //dd($this->department_id);
        $this->department_id? $this->department_id : $this->department_id=Department::first()->id;
        $data = Carbon::create($this->data)->format('Y-m-d');
        $time_array = DB::select('CALL procTimeList("'.$this->department_id.'", "'.$data . '")');
        $this->time_list = [];
        foreach ($time_array as $ta) {
            $this->time_list[] = $ta;
        }
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
        $this->clients_id = $client->id;
        $this->clients = $this->clients_id;
//        $this->dispatch('closeModal');
//        $this->ResetInputFields();
        session()->flash('success', 'Client has been added!');
    }

    public function ResetInputFields()
    {
        $this->first_name = '';
        $this->last_name = '';
        $this->phone = '';
        $this->Address = '';
    }

    public function newOrder()
    {
        $this->data = Carbon::create($this->data)->format('Y-m-d');

        $order = DB::select('SELECT * FROM orders ORDER BY id DESC LIMIT 0, 1');
        $this->num = $order[0]->id+1;
        $order = new Order();
        $order->num = $this->num;
        $order->data = $this->data;
        $order->department_id = $this->department_id;
        $cl_id = Client::select('id')->first();
        $order->clients_id = $cl_id->id;
        $order->employes_id = 3;
        $order->save();
        return redirect()->route('order-create', ['data'=>(\Carbon\Carbon::create($this->data)->format('Y-m-d')), 'dep_id'=>$this->department_id, 'number'=>$this->num]);
    }
}
