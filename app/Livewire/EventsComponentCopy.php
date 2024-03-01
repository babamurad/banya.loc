<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Event;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Livewire\Component;
use PhpOffice\PhpSpreadsheet\Calculation\DateTimeExcel\YearFrac;
use PhpOffice\PhpSpreadsheet\Shared\TimeZone;
use function Monolog\Formatter\format;
use Livewire\Attributes\On;

class EventsComponent extends Component
{
    public $year;
    public $month;
    public $data;
    public $weekString = ['Понедельник', 'Вторник','Среда','Четверг','Пятница','Суббота','Воскресенье'];
    public $monthStr = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
    public $daysM = [];
    public $startCalendar, $endCalendar;
    public $mon;
    public $startTime, $endTime;
    public $startOrder, $endOrder;
    public $searchClient = '';
    public $client_id, $orderClient;
    public $department_id;
    public $orders = [];

    public function render()
    {
        $today = Carbon::create($this->data);
        $tomorrow =Carbon::create($this->data)->tomorrow();
        $bookings = Event::whereBetween('startOrder', [$today, $tomorrow])->get()->toArray();
        if ((strlen($this->searchClient) >= 2))
        {
            $clients = Client::where('first_name','LIKE','%'. $this->searchClient .'%')
                ->orwhere('last_name','LIKE','%'. $this->searchClient .'%')->get();
        } else
        {
            $clients = Client::orderBy('first_name')->get();
        }
        $departments = Department::orderBy('id')->get();
        $date = $this->year . '/'. $this->mon . '/' . '01';
        $this->htmlCalendar = $this->calendar($date);
        return view('livewire.events-component', [
                'startCalendar',
                'endCalendar',
                'clients' => $clients,
                'departments' => $departments,
                'bookings' => $bookings,
                'dayData' => $this->data,
            ]);
    }

    public function AddBooking()
    {
        //dd($this->orderClient->id);
        $event = new Event();
        $event->title = 'Booking';
        $startDateTime = Carbon::create($this->data.' '.$this->startOrder);//->setTimeZone('Asia/Ashgabat');
        $event->startOrder = $startDateTime;
        $endDateTime = Carbon::create($this->data.' '.$this->endOrder);//->setTimeZone('Asia/Ashgabat');
        $event->endOrder = $endDateTime;

        $event->client_id = $this->orderClient->id;
        $event->department_id = $this->department_id;
        $event->save();
        $this->viewDay($this->data);
        session()->flash('success', 'Booking success!');
    }

    public function selClient($id)
    {
        $client = Client::find($id);
        $this->orderClient = $client;
        $this->searchClient = '';
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

        $a = '00:00';
        $b = '23:59';

        $this->startTime = strtotime($a);
        $this->endTime = strtotime($b);

        $this->orders = [];
        $today = Carbon::create($this->data);
        $tomorrow =Carbon::create($this->data)->tomorrow();
        $bookings = Event::whereBetween('startOrder', [$today, $tomorrow])->get()->toArray();
        $this->orders = $bookings;
        //dd($this->orders);
        //LVVDB24BOJDO12006
        //ADHJ00033
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
        return  $this->daysM; //$html;
    }

    public function viewDay($day)
    {
        if ($this->data == $day){
            return;
        }
        $this->data = Carbon::create($day)->format('d.m.Y 00:00:00');
        $today = Carbon::create($this->data)->format('Y-m-d 00:00:00');
        $tomorrow =Carbon::create($this->data)->format('Y-m-d 23:59:59');
        //dd($today.'-'.$tomorrow);
        //$this->orders = [];

        $bookings = Event::whereBetween('startOrder', [$today, $tomorrow])->get()->toArray();
        //whereDate('startOrder', '>=', $today)->whereDate('endOrder', '<=', $tomorrow)->get();
        //dd($bookings);
        $this->orders = $bookings;

        //dd($this->orders);
    }

    public function nextDay()
    {
        $dd = Carbon::create($this->data);
        $this->data = Carbon::create($this->year, $this->mon, $dd->format('d')+1);
    }

    public function prevDay()
    {
        $dd = Carbon::create($this->data);
        $this->data = Carbon::create($this->year, $this->mon, $dd->format('d')-1);
    }
}
