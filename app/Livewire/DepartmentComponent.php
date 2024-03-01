<?php

namespace App\Livewire;

use App\Models\Department;
use Livewire\Component;
use Livewire\WithPagination;

class DepartmentComponent extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $name, $price, $idc;
    public $sortBy = 'id';
    public $sortDirection = 'DESC';
    public $sortIcon = '<i class="fas fa-sort ml-1"></i>';

    protected $rules = [
        'name' => 'required|min:3',
        'price' => 'required',
    ];

    public function render()
    {
        $departments = Department::orderBy($this->sortBy, $this->sortDirection)->paginate(50);
        return view('livewire.department-component', compact('departments'));
    }

    public function storeDepartment()
    {
        $validated = $this->validate([
            'name' => 'required|min:3',
            'price' => 'required',
        ]);

        Department::create($validated);
        $this->ResetInputFields();
        $this->dispatch('closeCreateModal');
        session()->flash('success', 'Отдел был добавлен успешно.');
    }

    public function resetInputFields()
    {
        $this->name = '';
        $this->price = '';
    }

    public function edit($id)
    {
        $department = Department::findOrFail($id);
        $this->idc = $department->id;
        $this->name = $department->name;
        $this->price = $department->price;
    }

    public function updateDepartment()
    {
        $validated = $this->validate([
            'name' => 'required|min:3',
            'price' => 'required',
        ]);

//
        $department = Department::find($this->idc);
        $department->name = $this->name;
        $department->price = $this->price;
        $department->save();
        $this->ResetInputFields();
        $this->dispatch('closeEditModal');
        session()->flash('success', 'Отдел был изменен успешно.');
    }


    public function delete($id)
    {
        $department = Department::find($id);
        $department->delete();
        session()->flash('error', 'Отдел был удален.');
    }

    public function setSortBy($sortBy)
    {
        if ($sortBy == $this->sortBy)
        {
            $this->sortDirection = ($this->sortDirection == 'DESC') ? 'ASC' : 'DESC';
            if ($this->sortDirection == 'ASC')
            {
                $this->sortIcon = '<i class="fas fa-sort-up ml-1"></i>';
            } else
            {
                $this->sortIcon = '<i class="fas fa-sort-down ml-1"></i>';
            }

            return;
        }
        $this->sortBy = $sortBy;
        $this->sortDirection = 'ASC';
        $this->sortIcon = '<i class="fas fa-sort-up ml-1"></i>';
    }
}
