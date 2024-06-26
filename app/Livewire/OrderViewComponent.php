<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Employe;
use App\Models\JobTitle;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\TimeTb;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class OrderViewComponent extends Component
{
    public $first_name, $last_name, $phone, $Address;
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id;
    public $searchClient, $clients_id;
    public $data;
    public $employe_id, $job_id, $qty, $sum, $price;
    public $jobEnabled = 'disabled';

    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $startOrder, $endOrder;
    public $edit_id;

    public function render()
    {
        if (strlen($this->searchClient) <= 1) {
            $clients = Client::orderBy('first_name', 'ASC')->get();
        } else {
            $clients = Client::where('first_name', 'like', '%' . $this->searchClient . '%')->orwhere('last_name', 'like', '%' . $this->searchClient . '%')->get();
        }
        $employes = Employe::all();
        $time_list = DB::select('CALL procTimeList("' . $this->department_id . '", "' . $this->data . '")');
        $dep_name = Department::findOrFail($this->department_id);
        $dep_name = $dep_name->name;

        $departments = Department::all();

        if ($this->employe_id) {
            $jobtitles = JobTitle::where('employe_id', $this->employe_id)->get();
        } else {
            $jobtitles = JobTitle::all();
        }

        if ($this->job_id) {
            $selJob = JobTitle::where('id', $this->job_id)->first();
            $this->price = $selJob->price;
            $this->sum = $selJob->sum;
        }

        if ($this->num) {
            $details = OrderDetail::where('order_id', $this->num)->get();
            $order = Order::where('num', $this->num)->get();
        } else {
            $details = '';
        }
        $time_list = TimeTb::all();

        $order = Order::with('department', 'order_details')->where('id', '=', $this->edit_id)->first();
        return view('livewire.order-view-component', compact('employes', 'jobtitles', 'order', 'clients', 'time_list'));
    }

    public function mount($id)
    {

        $this->edit_id = $id;
        $order = Order::with('department', 'client')->find($this->edit_id);
        $this->num = $order->num;
        $this->department_id = $order->department_id;
        $this->clients_id = $order->client->id;
        $this->startOrder = $order->start;
        $this->endOrder = $order->end;
        $this->data = Carbon::create($order->data)->format('Y-m-d');
        $this->sum = $order->sum;
        $department = Department::findOrFail($this->department_id);
        $this->department_id = $department->id;
        $this->jprice = $department->price;
        $order_qty = DB::select('call procTimeDiff("' . $this->num . '")');
        $this->jqty = $order_qty[0]->tDiff;
    }

}
