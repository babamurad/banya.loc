<?php

namespace App\Livewire;

use App\Models\Employe;
use App\Models\JobTitle;
use Livewire\Component;
use Livewire\WithPagination;
use function Nette\Utils\isNumeric;

class JobTitleComponent extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $perPage = 10;
    public $search = '';
    public $us_count;
    public $sortBy = 'created_at';
    public $sortDirection = 'DESC';
    public $sortIcon = '<i class="fas fa-sort ml-1"></i>';
    public $name, $qty, $price, $desc, $idc, $sum;
    public $first_name, $last_name, $phone, $address, $department_id, $jobtitle_id, $role_id, $time;
    public $employe_name, $employe_id;


    public function resetEmployeFields()
    {
        $this->first_name = '';
        $this->last_name = '';
        $this->phone = '';
        $this->address = '';
    }
    public function SaveEmploye()
    {
        $this->validate([
            'first_name' => 'required|min:3',
            'last_name' => 'required|min:3',
            'phone' => 'required|min:5',
        ]);
        $employe = new Employe();
        $employe->first_name = $this->first_name;
        $employe->last_name = $this->last_name;
        $employe->phone = $this->phone;
        $employe->address = $this->address;
        $employe->department_id = $this->department_id;
        $employe->jobtitle_id = $this->jobtitle_id;
        $employe->role_id = $this->role_id;
        $employe->save();
        $this->resetEmployeFields();
        $this->dispatch('closeModal');
        session()->flash('success', __('Работник успешно добавлен!'));
    }
    public function AddJobTitle()
    {
        $this->validate([
            'name' => 'required|max:255',
            'qty' => 'required|numeric',
            'price' => 'required|numeric',
        ]);

        $jobtitle = new JobTitle();
        $jobtitle->name = $this->name;
        $jobtitle->desc = $this->desc;
        $jobtitle->price = $this->price;
        $jobtitle->qty = $this->qty;
        $jobtitle->time = $this->time;
        $jobtitle->employe_id = $this->employe_id;
        $jobtitle->save();
        $this->ResetInputFields();
        $this->dispatch('closeJobTitleModal');
        session()->flash('success', __('Job Title has ben added successfully!'));
    }

    public function edit($id)
    {
        $jobtitle = JobTitle::find($id);
        $this->idc = $jobtitle->id;
        $this->name = $jobtitle->name;
        $this->qty = $jobtitle->qty;
        $this->price = $jobtitle->price;
        $this->time = $jobtitle->time;
        $this->desc = $jobtitle->desc;
    }

    public function updateJobTitle()
    {
        $this->validate([
            'name' => 'required|max:255',
            'qty' => 'required|numeric',
            'price' => 'required|numeric',
        ]);

        $jobtitle = JobTitle::findOrFail($this->idc);
        $jobtitle->name = $this->name;
        $jobtitle->qty = $this->qty;
        $jobtitle->price = $this->price;
        $jobtitle->time = $this->time;
        $jobtitle->desc = $this->desc ? $this->desc : '';
        $jobtitle->save();
        $this->ResetInputFields();
        session()->flash('update', __('Job Title has been updated!'));
    }

    public function ResetInputFields()
    {
        $this->name = '';
        $this->qty = '';
        $this->price = '';
        $this->desc = '';
    }

    public function destroy($id)
    {
        $jobtitle = JobTitle::find($id);
        $jobtitle->delete();
        session()->flash('error', __('Job Title has been deleted!'));
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

    public function render()
    {
        if (is_numeric($this->price) && is_numeric($this->qty))
        {
            $this->sum = $this->qty * $this->price;
        }
        if ($this->employe_id){
            $jobtitles = JobTitle::
            where('employe_id', $this->employe_id)
                ->orderBy($this->sortBy, $this->sortDirection)
                ->paginate($this->perPage);
        } else {
            $jobtitles = JobTitle::
                orderBy($this->sortBy, $this->sortDirection)
                ->paginate($this->perPage);
        }

        $employes = Employe::all();
        return view('livewire.job-title-component', compact('jobtitles', 'employes'));
    }
}
