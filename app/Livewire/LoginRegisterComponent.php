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
        $user = $this->validate();

        if (Auth::attempt($user))
        {
            Auth::user($user);
            //dd(Auth::check());
            if ((auth()->user()->utype == 'ADM') || (auth()->user()->utype == 'KSS')){
                $this->redirectRoute('admin');
            } else {
                $this->redirectRoute('lock-screen');
            }
            session()->flash('success', __('Вы авторизованы.'));
        } else {
            session()->flash('error', __('Имя или пароль неверны'));
        }
    }

    public function logout()
    {
        auth()->logout();
        session()->flash('error', 'Выход из системы.');
        $this->redirectRoute('/');
    }

}
