<div wire:ignore.self class="modal fade" id="EditJobTitleDialog" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
            <div class="modal-header primary" style="background-color: #007bff;">
                <h4 class="modal-title text-white ">{{__('Edit Job Title')}}</h4>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="name">{{__('Service Name')}} </label>
                            <input name="name" type="text" class="form-control" placeholder=" {{__('Service Name')}} " wire:model.defer="name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="qty"> {{__('Quantity')}} </label>
                                <input name="qty" type="number" class="form-control" placeholder=" {{__('Quantity')}} " wire:model.defer="qty">
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="price"> {{__('Price')}} {{ __('per price') }} </label>
                                <input name="price" type="text" class="form-control" placeholder=" {{__('Price')}} " wire:model.defer="price">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="desc"> {{__('Descriptions')}} </label>
                                <textarea type="text" name="desc" class="form-control" id="desc" placeholder=" {{__('Enter Descriptions')}}"
                                wire:model.defer="desc" rows="3">
                                </textarea>
                            </div>
                        </div>
                    </div>
                  </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" wire:click="updateJobTitle"> {{__('Save changes')}} </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
