<?php

namespace App\Livewire;

use App\Models\Event;
use Carbon\Carbon;
use Livewire\Component;
use Livewire\Attributes\On;
use Livewire\Attributes\Reactive;


class DayTimeComponent extends Component
{
    public $dayData;
    public $data;

    public $startTime, $endTime;


    public function render()
    {
        if ($this->data){
            $today = Carbon::create($this->data);
            $tomorrow =Carbon::create($this->data)->tomorrow();
        } else {
            $today = Carbon::create()->now();
            $tomorrow =Carbon::create()->now();

        }
        $bookings = Event::whereBetween('startOrder', [$today, $tomorrow])
            ->orwhereBetween('startOrder', [$today, $tomorrow])
            ->get();
        return view('livewire.day-time-component', compact('bookings'));
    }


    public function mount($dayData)
    {
//        dd('here');
        $this->data = $dayData;
//        dd($this->data);
        $a = '00:00';
        $b = '23:59';

        $this->startTime = strtotime($a);
        $this->endTime = strtotime($b);
    }
}
