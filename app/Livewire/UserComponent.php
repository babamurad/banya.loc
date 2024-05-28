<?php

namespace App\Livewire;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
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
    public $name, $first_name, $last_name, $email, $password;
    public $utype, $edit_id, $status = false;// = 'Не активирован';
    public $isActive;

    protected $rules = [
        'first_name' => 'required|min:3|max:50',
        'last_name' => 'required|min:3|max:50',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:6',
    ];

    public function render()
    {
        $this->us_count = User::search($this->search)->count();
        $users = User::search($this->search)
            ->orderBy($this->sortBy, $this->sortDirection)
            ->paginate($this->perPage);
        return view('livewire.user-component', compact('users'));
    }

    public function createUser()
    {
        $validated = $this->validate();

        $user = new User();
        $user->utype = $this->utype? $this->utype : "USR";
        $user->status = $this->status == 1? 'Активирован':'Не Активирован';
        $user->first_name = $this->first_name;
        $user->last_name = $this->last_name;
        $user->email = $this->email;
        $user->password = $this->password;
        $user->save();

        $this->dispatch('closeCreateUserModal');
        session()->flash('success','Пользователь успешно создан.');
        $this->reset('first_name', 'last_name', 'email', 'password');
    }

    public function edit($id)
    {
        $user = User::findOrFail($id);
        $this->edit_id = $user->id;
        $this->utype = $user->utype;
        $this->status = $user->status == 'Активирован';
        $this->first_name = $user->first_name;
        $this->last_name = $user->last_name;
        $this->email = $user->email;
        $this->password = $user->password;
    }

    public function update()
    {
        $user = User::findOrFail($this->edit_id);

        $validatedData = $this->validate([
            'first_name' => 'required|min:3|max:50',
            'last_name' => 'required|min:3|max:50',
            'email' => 'required|string|email|unique:users,email,' . $user->id, // Exclude current user's ID from uniqueness check
            'password' => 'nullable|string|min:6', // Allow password update if provided
            // Add other validation rules as needed
        ]);


         $user->utype = $this->utype;
         $user->status = $this->status == 1? 'Активирован':'Не Активирован';
         $user->first_name = $this->first_name;
         $user->last_name = $this->last_name;
         $user->email = $this->email;
         $user->password = $this->password;
         $user->update();
         $this->dispatch('closeEditUserModal');
        session()->flash('success','Данные пользователя успешно изменены.');
        $this->reset('first_name', 'last_name', 'email', 'password');
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

}
