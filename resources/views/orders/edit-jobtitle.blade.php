<div wire:ignore.self class="modal fade" id="EditJobTitle" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
            <div class="modal-header primary" style="background-color: #007bff;">
                <h4 class="modal-title text-white ">{{ __('Добавить Услугу')}}</h4>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Выберите работника {{ $employe_id }} </label>
                                <select class="form-control" wire:model.live="employe_id">
                                    @foreach($employes as $employe)
                                        <option wire:key="{{ $employe->id }}" value="{{ $employe->id }}">{{ $employe->first_name }} {{ $employe->last_name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Выберите вид услуги {{ $job_id }} </label>
                                <select class="form-control" wire:model.live="job_id">
                                    @foreach($jobtitles as $jobtitle)
                                        <option wire:key="{{ $jobtitle->id }}" value="{{ $jobtitle->id }}">{{ $jobtitle->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="name">{{__('Количество')}} </label>
                                <input name="name" type="number" step="any" class="form-control" placeholder=" {{__('Количество')}} " wire:model.lazy="qty">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="name">{{__('Цена')}} </label>
                                <input name="name" type="number" class="form-control" placeholder=" {{__('Цена')}} " wire:model="price" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="name">{{__('Сумма')}} </label>
                                <input class="form-control" type="text" value="{{ $qty*$price }}" readonly>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <label>Textarea</label>
                        <textarea class="form-control" rows="3" placeholder="Enter ..." wire:model="Address"></textarea>
                    </div>

                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                <button type="submit" class="btn btn-primary" wire:click="EditOrderJob"> {{__('Save changes')}} </button>
            </div>
            <!-- /modal-content  -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
