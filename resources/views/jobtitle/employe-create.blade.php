<div wire:ignore.self class="modal fade" id="CreateEmploye" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
                <div class="modal-header primary" style="background-color: #007bff;">
                    <h4 class="modal-title text-white ">{{ __('Добавить работника')}}</h4>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="required-field" for="name">{{__('First Name')}} </label>
                                    <input name="name" type="text"
                                           class="form-control @error('first_name') is-invalid @enderror"
                                           placeholder=" {{__('First Name')}} " wire:model="first_name">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="last_name"> {{__('Last Name')}} </label>
                                    <input name="last_name" type="text" class="form-control"
                                           placeholder=" {{__('Last Name')}} " wire:model="last_name">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="required-field" for="phone"> {{__('Phone')}} </label>
                                    <input type="number" class="form-control @error('phone') is-invalid @enderror"
                                           id="phone" placeholder=" {{__('Phone')}} " wire:model="phone">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Textarea</label>
                            <textarea class="form-control" rows="3" placeholder="Enter ..." wire:model="address"></textarea>
                        </div>

                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                    <button type="submit" class="btn btn-primary" wire:click="SaveEmploye"> {{__('Save changes')}} </button>
                </div>
                <!-- /modal-content  -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

