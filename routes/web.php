<?php

use App\Livewire\Calendar;
use App\Livewire\ClientComponent;
use App\Livewire\DayEventsComponent;
use App\Livewire\DepartmentComponent;
use App\Livewire\EventsComponent;
use App\Livewire\HomeComponent;
use App\Livewire\JobTitleComponent;
use App\Livewire\LoginRegisterComponent;
use App\Livewire\OrderComponent;
use App\Livewire\OrderCreate;
use App\Livewire\ShiftCloseComponent;
use App\Livewire\UserComponent;
use App\Livewire\RegisterComponent;
use App\Livewire\LockScreenComponent;
use \App\Livewire\OrderEdit;


use App\Models\Order;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', LoginRegisterComponent::class);

Route::middleware(\App\Http\Middleware\AuthAdmin::class)->group(function (){
    Route::get('users', UserComponent::class)->name('users');
    Route::get('clients', ClientComponent::class)->name('clients');

    Route::get('day-events/{data?}/{dep_id?}', DayEventsComponent::class)->name('day-events');
});


Route::get('login', LoginRegisterComponent::class)->name('login');
Route::get('register', RegisterComponent::class)->name('register');
Route::get('lock-screen', LockScreenComponent::class)->name('lock-screen');

Route::get('admin', HomeComponent::class)->name('admin');

Route::get('/department', DepartmentComponent::class)->name('department');
Route::get('jobtitle', JobTitleComponent::class)->name('jobtitle');
Route::get('orders', OrderComponent::class)->name('orders');
Route::get('order-create/{data}/{dep_id}/{number}', OrderCreate::class)->name('order-create');

Route::get('order-edit/{id}', OrderEdit::class)->name('order-edit');


Route::get('shift', ShiftCloseComponent::class)->name('shift');

Route::get('events', EventsComponent::class)->name('events');
Route::get('full-calendar', \App\Livewire\FullCalendar::class)->name('full-calendar');
Route::get('calendar', Calendar::class)->name('calendar');
