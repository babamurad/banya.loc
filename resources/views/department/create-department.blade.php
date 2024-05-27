<div wire:ignore.self class="modal fade" id="CreateDepartment" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
            <div class="modal-header primary" style="background-color: #007bff;">
                <h4 class="modal-title text-white ">{{ __('Добавить Отдел')}}</h4>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="required-field" for="name">{{__('Название')}} </label>
                                <input name="name" type="text"
                                       class="form-control @error('name') is-invalid @enderror"
                                       placeholder=" {{__('Название')}} " wire:model="name">
                                @error('name')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="required-field" for="price"> {{__('Цена за 1 час')}} </label>
                                <input name="price" type="number" step="any" class="form-control @error('price') is-invalid @enderror"
                                       placeholder=" {{__('Цена')}} " wire:model="price">
                                @error('price')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Close')}} </button>
                <button type="submit" class="btn btn-primary" wire:click="storeDepartment"> {{__('Save changes')}} </button>
            </div>
            <!-- /modal-content  -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
