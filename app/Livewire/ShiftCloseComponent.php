<?php

namespace App\Livewire;

use App\Models\Department;
use App\Models\User;
use Livewire\Component;

class ShiftCloseComponent extends Component
{
    public function render()
    {
        $users = User::where('post_id', '=', 1)->get();
        $departments = Department::all();
        return view('livewire.shift-close-component', compact('users', 'departments'));
    }
}
