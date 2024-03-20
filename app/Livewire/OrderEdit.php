<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\Department;
use App\Models\Employe;
use App\Models\JobTitle;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class OrderEdit extends Component
{
    public $first_name, $last_name, $phone, $Address;
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id;
    public $searchClient, $clients_id;
    public $data;
    public $employe_id, $job_id, $qty, $sum, $price;
    public $jobEnabled = 'disabled';

    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $startOrder, $endOrder;

    protected $rules = [
        'first_name' => 'required|min:3',
        'phone' => 'required',
    ];
    public $edit_id;
    public function render()
    {
        if (strlen($this->searchClient) <= 1)
        {
            $clients = Client::orderBy('first_name', 'ASC')->get();
            //orderBy('first_name', 'ASC')->get();
        } else
        {
            $clients = Client::
            where('first_name', 'like', '%'.$this->searchClient.'%')->
            orwhere('last_name', 'like', '%'.$this->searchClient.'%')->
            get();
        }
        $employes = Employe::all();
        $time_list = DB::select('CALL procTimeList("'.$this->department_id.'", "'.$this->data . '")');
        //dd($time_list[0]->time);
        $dep_name = Department::findOrFail($this->department_id);
        $dep_name = $dep_name->name;

        $departments = Department::all();

        if ($this->employe_id){
            $jobtitles = JobTitle::where('employe_id', $this->employe_id)->get();
        } else {
            $jobtitles = JobTitle::all();
        }

        if ($this->job_id){
            $selJob = JobTitle::where('id', $this->job_id)->first();
            $this->price = $selJob->price;
            $this->sum = $selJob->sum;
        }

        if ($this->num){
            $details = OrderDetail::where('order_id', $this->num)->get();
            $order = Order::where('num', $this->num)->get();
            //dd($order[0]->start);
            $this->startOrder = $order[0]->start;
            $this->endOrder = $order[0]->end;

        } else {
            $details = '';
        }
        return view('livewire.order-edit');
    }

    public function mount($id)
    {
        $this->edit_id = $id;
    }
}
