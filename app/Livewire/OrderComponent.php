<?php

namespace App\Livewire;

use App\Models\Client;
use App\Models\JobTitle;
use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;

class OrderComponent extends Component
{

    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $perPage = 10;
    public $search = '';
    public $us_count;
    public $sortBy = 'created_at';
    public $sortDirection = 'DESC';
    public $sortIcon = '<i class="fas fa-sort ml-1"></i>';
    public $searchClient = '';
    public $orderClient;

    public $name, $num, $data, $employes_id, $client_id, $qty, $price, $sum, $discount, $desc;
    public $order_id, $jobtitle, $detail_qty, $detail_price, $detail_sum;

    public function changeJob()
    {
        $jobtitle = JobTitle::where('name', '=', $this->jobtitle)->get();
        $qtys = [];
        $prices = [];
        foreach ($jobtitle as $key => $value) {
            $qtys[] = $value->qty;
            $prices[] = $value->price;
        }
        //dd($prices);
        $this->qty = $qtys[0];
        $this->price = $prices[0];
        $disc = $this->discount ? $this->discount:0;
        $this->sum = $this->qty * $this->price - $this->sum * $this->discount/100;
    }

    public function changeSum()
    {
        //dd($this->price);
        $this->sum = $this->qty * $this->price - $this->sum * $this->discount/100;
    }

    public function AddOrder()
    {
        //
    }


    public function mount()
    {

    }

    public function updateClients($value)
    {
        dd($value);
    }

    public function hydrate()
    {
        //$this->emit('data-change-event');
    }

    public function selClient($id)
    {
        //dd('client selected');
        $client = Client::find($id);
        $this->orderClient = $client;
        $this->searchClient = '';
    }
    public function render()
    {
        if (strlen($this->searchClient) <= 1)
        {
            $clients = Client::orderBy('first_name')->get();
        } else {
            $clients = Client::
            where('first_name','LIKE','%'. $this->searchClient .'%')
            ->orWhere('last_name','LIKE','%'. $this->searchClient .'%')->get();
            //dd($clients->findOrFail(1));
        }
        //$clients = Client::all();

        $jobtitles = JobTitle::all();
        $orders = Order::search($this->search)
        ->orderBy($this->sortBy, $this->sortDirection)
        ->paginate($this->perPage);
        return view('livewire.order-component', compact('orders', 'clients', 'jobtitles'));
    }
}
