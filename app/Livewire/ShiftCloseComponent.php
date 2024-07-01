<?php

namespace App\Livewire;

use App\Models\Department;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class ShiftCloseComponent extends Component
{
    public $totalSum;
    public $start, $end, $time;

    public function render()
    {           
        if(auth()->user()->utype == 'ADM') {
            $users = User::where('utype', '=', 'KSS')->get();
        } elseif(auth()->user()->utype == 'KSS') {
            $users = User::where('id', '=', auth()->user()->id)->get();
        } 
        

        $userId = auth()->user()->id;
        // Получение списка из процедуры (выводится из первого SELECT в процедуре)
        $departments = DB::select("
SELECT d.id, d.name AS name, COALESCE(SUM(orders.sum), 0) AS total_sum
FROM departments d
LEFT JOIN orders ON orders.department_id = d.id AND orders.user_id = ? 
  AND orders.data='2024-06-30' 
  AND orders.start>? 
  AND orders.end<?
GROUP BY d.id
        ", [$userId, $this->start, $this->end]);


        return view('livewire.shift-close-component', compact('users', 'departments'));
    }

    public function mount()
    {
        $this->start = '06:00:00';
        $this->end = '10:00:00';
    }

    public function updatedTime()
    {
        switch ($this->time) {
            case 10:
                $this->start = '10:00:00';
                $this->end = '16:30:00';
              break;
            case 16:
                $this->start = '16:30:00';
                $this->end = '22:30:00';
              break;
            default:
            $this->start = '06:00:00';
            $this->end = '10:00:00';
          }
          
    }

}
