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
    public $name, $firstname, $lastname, $email, $password;
    public $utype, $edit_id, $status;

    protected $rules = [
        'firstname' => 'required|min:3|max:50',
        'lastname' => 'required|min:3|max:50',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:6',
    ];

    public function edit($id)
    {
        $user = User::findOrFail($id);
        $this->edit_id = $user->id;
        $this->name = $user->name;
        $this->utype = $user->utype;
        $this->status = $user->status;
        $this->firstname = $user->first_name;
        $this->lastname = $user->last_name;
        $this->email = $user->email;
        $this->password = $user->password;
    }

    public function update()
    {
        $user = User::findOrFail($this->edit_id);
         $user->name = $this->name;
         $user->utype = $this->utype;
         $user->status = $this->status;
         $user->first_name = $this->firstname;
         $user->last_name = $this->lastname;
         $user->email = $this->email;
         $user->password = $this->password;
         $user->update();
         $this->dispatch('closeEditUserModal');
        session()->flash('success','Данные пользователя успешно изменены.');
    }

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
