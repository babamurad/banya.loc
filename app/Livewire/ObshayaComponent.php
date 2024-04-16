<?php

namespace App\Livewire;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class ObshayaComponent extends Component
{
    public $num;
    public function render()
    {
        return view('livewire.obshaya-component');
    }

    public function addOrder()
    {
        $numb = DB::select('call procNewNumber()');
        $this->num = $numb[0]->Number;

    }
}
