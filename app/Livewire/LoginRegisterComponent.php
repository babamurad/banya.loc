<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class LoginRegisterComponent extends Component
{
    public $email;
    public $password;

    protected $rules = [
        'email' => 'required|min:3|max:50',
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
            if (auth()->user()->utype == 'KSS' || auth()->user()->utype == 'ADM'){
                //dd(auth()->user()->utype.' - '.auth()->user()->status);
                return redirect()->route('admin');
            } else {
                //dd(auth()->user()->utype.' - '.auth()->user()->status);
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
