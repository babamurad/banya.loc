<?php

namespace App\Livewire;

use Livewire\Component;

class LoginRegisterComponent extends Component
{
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
            if (auth()->user()->utype == 'ADM'){
                $this->redirectRoute('admin');
            } else {

            }
            session()->flash('success', __('You are logged in'));
        } else {
            session()->flash('error', __('The username or password is incorrect '));
        }
    }

    public function logout()
    {
        auth()->logout();
        session()->flash('error', 'You are logged out');
        $this->redirectRoute('/');
    }

}
