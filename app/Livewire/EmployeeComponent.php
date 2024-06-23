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
    public $edit_id, $orderDetails_id, $orderDetails;

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
        session()->flash('success', 'Работник успешно добавлен!');
    }

    public function delete($id)
    {        
        try
        {
            $employee = Employe::findOrFail($id);
            $employee->delete();
            session()->flash('error', 'Работник успешно удален!');
        }
        catch (\Throwable $e) {
            session()->flash('error', 'Сотрудник имеет заказы, поэтому нельзя удалить');
            session()->flash('error', $e);
        }
        
        
    }

    public function edit($id)
    {
        $employee = Employe::find($id);
        $this->first_name = $employee->first_name;
        $this->last_name = $employee->last_name;
        $this->phone = $employee->phone;
        $this->address = $employee->address;
        $this->edit_id = $employee->id;
    }

    public function update()
    {
        $employee = Employe::find($this->edit_id);

        $employee->first_name = $this->first_name;
        $employee->last_name = $this->last_name;
        $employee->phone = $this->phone;
        $employee->address = $this->address;
        $employee->update();
        //
        $this->reset('first_name', 'last_name', 'phone', 'address');
        $this->dispatch('closeEditEmployeeModal');
        session()->flash('success', 'Данные работника успешно изменены!');
    }

}
