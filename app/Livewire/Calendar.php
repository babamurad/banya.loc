<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Event;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Livewire\Attributes\Rule;
use Livewire\Component;

class Calendar extends Component
{
    public $searchClient = '';
    public $orderClient;
    protected $listeners = [
        'idToParent'
    ];

    public $client_id, $department_id;

    public function idToParent($id)
    {
        //dd($id);
        $this->client_id = $id;
        return $this->client_id;
    }

    public function newEvent($name, $startDate, $endDate)
    {
        //dd($this->client_id.'-'.$this->department_id);
        $validated = Validator::make(
            [
                'title' => $name,
                'start' => $startDate,
                'end' => $endDate,
            ],
            [
                'title' => 'required|min:1|max:40',
                'start' => 'required',
                'end' => 'required',
            ]
        )->validate();

        $event = new Event();
        $event->title = $name;
        $event->start = $startDate;
        $event->end = $endDate;
        $event->client_id = $this->client_id;
        $event->department_id = $this->department_id;
        $event->save();
//        $event = Event::create([
//            'title' => $name,
//            'start' => $startDate,
//            'end' => $endDate,
//            'client_id' => $this->client_id,
//            'department_id' => $this->department_id,
//        ]);
        //$this->redirect('calendar');
        return $event->id;
    }

    public function updateEvent($id, $name, $startDate, $endDate)
    {
        $validated = Validator::make(
            [
                'start' => $startDate,
                'end' => $endDate,
            ],
            [
                'start' => 'required',
                'end' => 'required',
            ]
        )->validate();

        Event::findOrFail($id)->update($validated);
        $this->redirect('calendar');
    }

    public function render()
    {
        $events = [];

        foreach (Event::all() as $event) {
            $events[] =  [
                'id' => $event->id,
                'title' => $event->name,
                'start' => $event->start,
                'end' => $event->end,
            ];
        }
        if ((strlen($this->searchClient) >= 3))
        {
            $clients = Client::where('first_name','LIKE','%'. $this->searchClient .'%')
                ->orwhere('last_name','LIKE','%'. $this->searchClient .'%')->get();
        } else
        {
            $clients = Client::all();
        }
        return view('livewire.calendar', [
            'events' => $events,
            'clients' => $clients,
        ]);
    }
}
