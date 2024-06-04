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
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Выберите работника</label>
                            <select class="form-control" wire:model.live="employe_id">
                                @foreach($employes as $employe)
                                    <option wire:key="{{ $employe->id }}" value="{{ $employe->id }}">{{ $employe->first_name }} {{ $employe->last_name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label for="name">{{__('Название услуги')}} </label>
                        <input name="name" type="text" class="form-control" placeholder=" {{__('Service Name')}} " wire:model="name">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="qty"> {{__('Количество')}} </label>
                            <input name="qty" type="number" step="any"class="form-control" placeholder=" {{__('Quantity')}} " wire:model.live="qty">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="price"> {{__('Цена')}} {{ __('per price') }} </label>
                            <input name="price" type="number" step="any" class="form-control" placeholder=" {{__('Price')}} " wire:model.live="price">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="price"> {{__('Время (минут)')}} </label>
                            <input name="price" type="number" step="15" class="form-control" placeholder=" {{__('Время')}} " wire:model.live="time">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="qty"> {{__('Сумма')}} </label>
                            <input name="qty" type="number" step="any"class="form-control" placeholder=" {{__('Сумма')}} " wire:model.live="sum">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="desc"> {{__('Пометка')}} </label>
                            <textarea type="text" name="desc" class="form-control" id="desc" placeholder=" {{__('Введите текст пометки')}} " wire:model="desc" rows="3">
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
