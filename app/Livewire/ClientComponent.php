<?php

namespace App\Livewire;

use App\Models\Client;
use Livewire\Component;
use Livewire\WithPagination;

class ClientComponent extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $perPage = 10;
    public $search = '';
    public $us_count;
    public $sortBy = 'created_at';
    public $sortDirection = 'DESC';
    public $sortIcon = '<i class="fas fa-sort ml-1"></i>';


    public $first_name;
    public $last_name, $phone, $address, $email, $idc;

    protected $rules = [
        'first_name' => 'required|min:5',
        'phone' => 'required|min:5',
    ];
    protected $messages = [
        'first_name.required' => 'Имя объязательное.',
        'first_name.min' => 'Имя должно быть не меньше 3-х символов.',
        'phone.required' => 'Номер телефона объязателен.',
        'phone.min' => 'Телефон должен быть не меньше 5 ти цифр.',
    ];

    public function edit($id)
    {
        $client = Client::findOrFail($id);
        $this->idc = $client->id;
        $this->first_name = $client->first_name;
        $this->last_name = $client->last_name;
        $this->email = $client->email;
        $this->phone = $client->phone;
        $this->address = $client->address;
    }

    public function updateClient()
    {
        $this->validate();

        $client = Client::findOrFail($this->idc);
        $client->first_name = $this->first_name;
        $client->last_name = $this->last_name;
        $client->phone = $this->phone ? $this->phone : 0;
        $client->address = $this->address ? $this->address : '';
        $client->email = $this->email ? $this->email :'';
        $client->update();
        $this->dispatch('closeUpdateModal');
        $this->ResetInputFields();
        session()->flash('update', 'Client has been updated!');
    }

    public function ResetInputFields()
    {
        $this->first_name = '';
        $this->last_name = '';
        $this->phone = '';
        $this->address = '';
        $this->email = '';
    }

    public function SaveClient()
    {
        $this->validate();

        $client = new Client();
        $client->first_name = $this->first_name;
        $client->last_name = $this->last_name;
        $client->phone = $this->phone ? $this->phone : 0;
        $client->address = $this->address ? $this->address : '';
        $client->save();

        $this->dispatch('closeCreateModal');
        session()->flash('success', 'Client has been added!');
        $this->reset(['first_name', 'last_name', 'phone', 'address']);

    }

    public function updatedSearch()
    {
        $this->resetPage();
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
        $user = Client::find($id);
        $user->delete();
        session()->flash('error', 'Client has been deleted!');
    }

    public function render()
    {
        $this->us_count = Client::search($this->search)->count();
        $clients = Client::search($this->search)
        ->orderBy($this->sortBy, $this->sortDirection)
        ->paginate($this->perPage);
        return view('livewire.client-component', compact('clients'));
    }
}
