<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group" data-select2-id="44">
                <label>{{ __('Clients') }}
                    <span class="badge badge-info right">{{ $clients->count() }}</span>
                </label>
                <div style="position:relative">
                    <input wire:model.live="searchClient" class="form-control relative" type="text"
                           placeholder="Search..." />
                </div>
                <div style="position:absolute; z-index:100">
                    @if(strlen($searchClient)>0)
                        @if($clients->count())
                            <ul class="list-group">
                                @foreach($clients as $client)
                                    {{-- <li>client</li> --}}
                                    <li class="list-group-item list-group-item-action"
                                        wire:click='selClient("{{ $client->id }}")' >
                                            <span> {{$client->id . ': ' . $client->first_name . ' ' . $client->last_name
                                                }} </span>
                                    </li>
                                @endforeach
                            </ul>
                        @else
                            <li class="list-group-item">Found nothing...</li>
                        @endif
                    @endif
                </div>
                <select wire:ignore class="form-control @error('client_id') is-invalid @enderror" style="width: 100%;"
                        aria-hidden="true" wire::model="client_id">
                    <option id="client" selected="selected" value="{{ $orderClient ? $orderClient : 0 }}"
                            data-select2-id="0" >
                        @if ($orderClient)
                            {{ $orderClient->first_name . ' ' . $orderClient->last_name }}
                        @else
                            -- {{ __('Select Client') }} --
                        @endif

                    </option>
                    @if(strlen($searchClient)>0)
                    @foreach ($clients as $client)
                        <option value="{{ $client->id }}" data-select2-id="{{ $client->id }}" wire:click.prevent='selClient("{{ $client->id }}")'> {{
                                        $client->first_name . ' ' . $client->last_name }} </option>
                    @endforeach
                    @endif
                </select>
            </div>
        </div>
    </div>
</div>
