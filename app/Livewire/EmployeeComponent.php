<?php

namespace App\Livewire;

use App\Models\Employe;
use Livewire\Component;
use Livewire\WithPagination;

class EmployeeComponent extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $perPage = 10;

    public function render()
    {
        $employees = Employe::paginate($this->perPage);
        return view('livewire.employee-component', compact('employees'));
    }

}
