<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class LoginRegisterComponent extends Component
{
    public $name;
    public $password;

    protected $rules = [
        'name' => 'required|min:3|max:50',
        'password' => 'required|min:6',
    ];
    public function render()
    {
        return view('livewire.login-register-component')
        ->layout('components.layouts.login');
    }

    public function login()
    {
        $data = $this->validate();
        
        if (Auth::attempt($data)){
            if (auth()->user()->utype == 'KSS' || auth()->user()->utype == 'ADM'){
                //dd(auth()->user()->utype.' - '.auth()->user()->status);
                return redirect()->route('admin');
            } else {
                //dd(auth()->user()->utype.' - '.auth()->user()->status);
                $this->redirectRoute('lock-screen');
            }
            session()->flash('success', 'Вы авторизованы.');            
        } else {
            session()->flash('error', 'Логин или пароль неверны.');
        }
         
    }

    public function logout()
    {
        auth()->logout();
        session()->flash('error', 'Выход из системы.');
        $this->redirectRoute('/');
    }

}
