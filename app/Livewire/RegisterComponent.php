<?php

namespace App\Livewire;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;


class RegisterComponent extends Component
{
    public $firstname;
    public $lastname;
    public $email;
    public $password;

    protected $rules = [
        'firstname' => 'required|min:3|max:50',
        'lastname' => 'required|min:3|max:50',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:6',
    ];

//    protected $rules = [
//        'firstname' => 'required',
//        'lastname' => 'required',
//        'password' => 'required',
//    ];

    public function registerUser()
    {
        //dd('validate');
        $this->validate();

        $user = new User();
        $user->name = $this->firstname;
        $user->first_name = $this->firstname;
        $user->last_name = $this->lastname;
        $user->email = $this->email;
        $user->password = $this->password;
        $user->save();

        session()->flash('success', 'Successful registration');
        Auth::login($user);

        $this->redirectRoute('lock-screen');
    }

    public function render()
    {
        return view('livewire.register-component')
            ->layout('components.layouts.login');
    }
}
