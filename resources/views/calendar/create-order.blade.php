<div wire:ignore.self class="modal fade" id="CreateOrder" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card">
        <div class="modal-content">
            <div class="modal-header primary" style="background-color: #007bff;">
                <h4 class="modal-title text-white ">{{ __('Add Order')}}</h4>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12 d-flex">
                            <label class="card-title w-100 d-flex">
                                {{ __('Client') }}
{{--                                <button class="btn btn-sm text-green" id="vis" ><i class="fas fa-plus"></i> </button>--}}
                            </label>
                        </div>

                        <div wire:ignore class="col-md-12" id="sel-client">
                            <div class="form-group">
                                <select id="select-beast" placeholder="Select a person..." autocomplete="off"
                                        wire:model="clients_id">
                                    <option value="">Select a person...</option>
                                    @foreach ($clients as $client)
                                        <option value="{{ $client['id'] }}" wire:key="client-{{ $client['id'] }}">
                                            {{ $client['first_name'] . ' ' . $client['last_name'] . '  Tel: ' . $client['phone'] }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>



                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>{{__('Start Time')}} {{count($time_list)}}</label>
                                <select class="custom-select" wire:model="startOrder">
                                    @foreach($time_list  as $times)
                                        <option>{{$times->time}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>{{__('End Time')}}</label>
                                <select class="custom-select" wire:model="endOrder">
                                    @foreach($time_list  as $times)
                                        <option>{{$times->time}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1"> {{__('Note')}} {{$clients_id}} </label>
                                <textarea type="text" class="form-control" id="exampleInputEmail1" placeholder=" {{__('Enter notes')}} " rows="3">
                                </textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" wire:click.prevent='AddBooking'> {{__('Save changes')}} </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->

</div>
