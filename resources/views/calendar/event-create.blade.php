<!-- Start popup dialog box -->
<div  wire:ignore.self class="modal fade" id="EventCreate" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">Add New Event</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="img-container">
                    <div class="row">
                        <div class="col-sm-12">
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
                                                        wire:click='selClient("{{ $client->id }}")'>
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
                                <select id="client" class="form-control @error('client_id') is-invalid @enderror" style="width: 100%;"
                                        aria-hidden="true" wire::model.live="client_id">
                                    <option selected="selected" value="{{ $orderClient ? $orderClient : 0 }}"
                                            data-select2-id="0">
                                        @if ($orderClient)
                                            {{ $orderClient->first_name . ' ' . $orderClient->last_name }}
                                        @else
                                            -- {{ __('Select Client') }} --
                                        @endif

                                    </option>
                                    @foreach ($clients as $client)
                                        <option value="{{ $client->id }}" data-select2-id="{{ $client->id }}"> {{
                                        $client->first_name . ' ' . $client->last_name }} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="saveBtn" type="button" class="btn btn-primary">Save Event</button>
            </div>
        </div>
    </div>
</div>
<!-- End popup dialog box -->
