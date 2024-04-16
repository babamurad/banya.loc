<?php

namespace App\Livewire;

use App\Models\Order;
use App\Models\TimeTb;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class ObshayaComponent extends Component
{
    public $order_id, $num, $order_data, $employes_id, $department_id, $total_sum, $desc, $depart_id;
    public $startOrder = "06:00", $endOrder;
    public $jobtitle_id, $jqty, $jprice, $jsum, $dep_sum;
    public $details_sum;
    public $visOrder = true;
    public $qtyAdults = 1, $qtyChildren = 0;

    public function render()
    {
        $time_list = TimeTb::all();
        return view('livewire.obshaya-component', compact('time_list'));
    }

    public function addOrder()
    {
        $numb = DB::select('call procNewNumber()');
        $this->num = $numb[0]->Number;

        $order = new Order();

    }

    public function toggleNewOrder()
    {
        $this->visOrder = !$this->visOrder;
        $numb = DB::select('call procNewNumber()');
        $this->num = $numb[0]->Number;
    }

    public function updatedEndOrder()
    {
        $t1 = strtotime($this->startOrder);
        $t2 =  strtotime($this->endOrder);
        $this->jqty = ($t2 - $t1) / 3600;

        $this->jsum = $this->qtyAdults * 70 * $this->jqty + $this->qtyChildren * 30 * $this->jqty;

    }

    public function updatedqtyAdults()
    {
        $this->updatedEndOrder();
    }
    public function updatedqtyChildren()
    {
        $this->updatedEndOrder();
    }
}
