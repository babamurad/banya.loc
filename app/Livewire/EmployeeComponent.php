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

    public $first_name, $last_name, $phone, $address;

    protected $rules = [
            'first_name' => 'required|min:3',
            'phone' => 'required|min:5',
    ];

    public function render()
    {
        $employees = Employe::paginate($this->perPage);
        return view('livewire.employee-component', compact('employees'));
    }

    public function SaveEmploye()
    {
        $this->validate();        

        $employee = new Employe($this->all());
        $employee->save();
        $this->reset('first_name', 'last_name', 'phone', 'address');
        $this->dispatch('closeCreateModal');
        session()->flash('success', __('Работник успешно добавлен!'));
    }

    public function delete($id)
    {
        $employee = Employe::find($id);
        $employee->delete();
        session()->flash('error', __('Employee has been deleted!'));
    }

}
