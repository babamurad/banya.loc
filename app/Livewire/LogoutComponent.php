<?php

namespace App\Livewire;

use Livewire\Component;

class LogoutComponent extends Component
{
    public function render()
    {
        return view('livewire.logout-component');
    }

    public function logout()
    {
        auth()->logout();
        session()->flash('error', 'Выход из системы.');
        $this->redirectRoute('login');
    }
}
