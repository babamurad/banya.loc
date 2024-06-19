<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;


class LockScreenComponent extends Component
{
    public function render()
    {
        return view('livewire.lock-screen-component')
            ->layout('components.layouts.login');
    }

    public function logoutLogin()
    {
        auth()->logout();
        return redirect()->route('login');
    }

    public function login()
    {
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
}
