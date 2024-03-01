<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Event;
use Livewire\Component;
use Illuminate\Support\Str;

class FullCalendar extends Component
{

    public $title, $startOrder, $endOrder, $order_id, $start, $end, $client_id, $department_id;
    public $searchClient, $orderClient;

    public function render()
    {

        if ((strlen($this->searchClient) >= 3))
        {
            $clients = Client::where('first_name','LIKE','%'. $this->searchClient .'%')
            ->orwhere('last_name','LIKE','%'. $this->searchClient .'%')->get();
        } else
        {
            $clients = Client::all();
        }

        $events = [];
        foreach (Event::all() as $event)
        {
            $events[] = [
                'id' => $event->id,
                'title' => $event->title,
                'start' => $event->start,
                'end' => $event->end,
            ];
        }
        return view('livewire.full-calendar', compact('events', 'clients'));
    }

    public function createEvent($title,  $start, $end)
    {
        //dd($title);
        $this->validate([
            'title' => 'required|min:1|max:40',
            'startOrder' => 'required',
            'endOrder' => 'required',
            'start' => 'required',
            'end' => 'required',
        ]);

        $event = new Event();
        $event->title = 'order';
        $event->client_id = $this->client_id;
//        $event->department_id = $this->department_id;
        $event->start = $start;
        $event->end = $end;
        $event->startOrder = $start;
        $event->endOrder = $end;
        $event->save();
//        $this->ResetInputFields();
//        route()->redirect('full-calendar');
    }

    public function ResetInputFields()
    {
        $this->title = '';
        $this->client_id = '';
        $this->department_id = '';
        $this->start = '';
        $this->startOrder = '';
        $this->end = '';
        $this->endOrder = '';
    }

    public function selClient($id)
    {
        //dd('client selected');
        $client = Client::find($id);
        $this->orderClient = $client;
        $this->searchClient = '';
    }

    public function newEvent($name, $startDate, $endDate)
    {

        $validated = Validator::make(
            [
                'name' => $name,
                'start_time' => $startDate,
                'end_time' => $endDate,
            ],
            [
                'name' => 'required|min:1|max:40',
                'start_time' => 'required',
                'end_time' => 'required',
            ]
        )->validate();

        $event = Event::create(
            $validated
        );

        return $event->id;
    }
}
