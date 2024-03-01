<?php

use App\Livewire\Calendar;
use App\Livewire\ClientComponent;
use App\Livewire\DayEventsComponent;
use App\Livewire\DepartmentComponent;
use App\Livewire\EventsComponent;
use App\Livewire\HomeComponent;
use App\Livewire\JobTitleComponent;
use App\Livewire\OrderComponent;
use App\Livewire\OrderCreate;
use App\Livewire\ShiftCloseComponent;
use App\Livewire\UserComponent;


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

Route::get('/', function () {
    return view('welcome');
});

Route::get('admin', HomeComponent::class)->name('admin');
Route::get('users', UserComponent::class)->name('users');
Route::get('clients', ClientComponent::class)->name('clients');
Route::get('/department', DepartmentComponent::class)->name('department');
Route::get('jobtitle', JobTitleComponent::class)->name('jobtitle');
Route::get('orders', OrderComponent::class)->name('orders');
Route::get('order-create/{data}/{dep_id}/{number}', OrderCreate::class)->name('order-create');

Route::get('day-events', DayEventsComponent::class)->name('day-events');
Route::get('shift', ShiftCloseComponent::class)->name('shift');

Route::get('events', EventsComponent::class)->name('events');
Route::get('full-calendar', \App\Livewire\FullCalendar::class)->name('full-calendar');
Route::get('calendar', Calendar::class)->name('calendar');
