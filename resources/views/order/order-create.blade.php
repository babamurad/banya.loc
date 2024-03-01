<div wire:ignore.self class="modal fade" id="CreateJobTitleDialog" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
            <div class="modal-header primary" style="background-color: #007bff;">
                <h4 class="modal-title text-white ">{{ __('Create Order')}}</h4>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">{{__('Number')}} </label>
                                <input name="name" type="number" placeholder="0.00" required min="0" value="0" step="1" class="form-control @error('num') is-invalid @enderror"
                                    wire:model="num">
                            </div>
                        </div>
                        <div class="col-md-6">
                            {{-- <div class="form-group">
                                <label for="data"> {{__('Date')}} </label>
                                <input name="data" type="text" class="form-control @error('data') is-invalid @enderror" placeholder=" {{__('Date')}} "
                                    wire:model="data">
                            </div> --}}
                            <div class="form-group">
                                <label>{{__('Date')}}:</label>
                                  <div class="input-group date @error('data') is-invalid @enderror" id="reservationdate" data-target-input="nearest" wire:model="data">
                                      <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate">
                                      <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                          <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                      </div>
                                  </div>
                              </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
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
                                <select class="form-control @error('client_id') is-invalid @enderror" style="width: 100%;"
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
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>{{__('Job Title')}}</label>
                                <select class="form-control @error('jobtitle') is-invalid @enderror" id="select-job"
                                wire:model="jobtitle" wire:change="changeJob">
                                {{-- wire:change="changeJob('{{$jobtitle->id}}')" --}}
                                    <option selected="selected" value="">-- {{ __('Select Job Title') }} --</option>
                                    @foreach ($jobtitles as $jobtitle)
                                    <option data-select2-id="{{$jobtitle->id}}">{{ $jobtitle->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card p-3">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" placeholder="0.00" required min="0" value="0" step="1" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" wire:model.live="qty" wire:change='changeSum'>
                              </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" placeholder="0.00" required min="0" value="0" step="0.05" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" wire:model.live="price" wire:change='changeSum'>
                              </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Discount %</label>
                                <input type="number" placeholder="0.00" required min="0" value="0" step="0.05" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" wire:model.live="discount" wire:change='changeSum'>
                              </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Summary</label>
                                <input type="number" placeholder="0.00" required min="0" value="0" step="0.05" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" wire:model.live="sum">
                              </div>
                        </div>
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="desc"> {{__('Descriptions')}} </label>
                                <textarea type="text" name="desc" class="form-control" id="desc"
                                    placeholder=" {{__('Enter Descriptions')}} " wire:model="desc" rows="3"  wire:model="desc">

                                </textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" wire:click='AddOrder'> {{__('Save
                    changes')}} </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
