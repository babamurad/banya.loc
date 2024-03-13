<?php

namespace App\Livewire;

use Livewire\Component;

class LockScreenComponent extends Component
{
    public function render()
    {
        return view('livewire.lock-screen-component')
            ->layout('components.layouts.login');
    }
}
