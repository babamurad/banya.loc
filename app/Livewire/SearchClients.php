<?php

namespace App\Livewire;

use App\Models\Client;
use Livewire\Component;

class SearchClients extends Component
{

    public $searchClient = '';
    public $orderClient;
    public $client_id;

    public function render()
    {
        if ((strlen($this->searchClient) >= 2))
        {
            $clients = Client::where('first_name','LIKE','%'. $this->searchClient .'%')
                ->orwhere('last_name','LIKE','%'. $this->searchClient .'%')->get();
        } else
        {
            $clients = Client::orderBy('first_name')->get();
        }
        return view('livewire.search-clients', compact('clients'));
    }

    public function selClient($id)
    {
        $client = Client::find($id);
        $this->orderClient = $client;
        $this->searchClient = '';
        $this->client_id = $client->id;
        //dd($this->client_id);
        $this->dispatch('idToParent', $this->client_id);
    }
}
