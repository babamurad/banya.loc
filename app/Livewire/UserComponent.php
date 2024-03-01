<?php

namespace App\Livewire;

use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;

class UserComponent extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $perPage = 10;
    public $search = '';
    public $us_count;
    public $sortBy = 'created_at';
    public $sortDirection = 'DESC';
    public $sortIcon = '<i class="fas fa-sort ml-1"></i>';

    public function updatedSearch()
    {
        $this->resetPage();
    }

    public function success()
    {
        session()->flash('success','Success Test!!!');
    }
    public function danger()
    {
        session()->flash('error','Success Error Test!!!');
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

    public function delete($id)
    {
        $user = User::find($id);
        $user->delete();
    }

    public function render()
    {
        
        $this->us_count = User::search($this->search)->count();
        $users = User::search($this->search)
                ->orderBy($this->sortBy, $this->sortDirection)
                ->paginate($this->perPage);
        return view('livewire.user-component', compact('users'));
    }
}
