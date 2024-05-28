<div class="modal fade" id="CreateUserDialog" role="viewDialog" aria-hidden="true">
    <div class="modal-dialog card" style="max-width: 50%;">
        <div class="modal-content">
          <div class="modal-header primary" style="background-color: #007bff;">
            <h4 class="modal-title text-white ">Create User</h4>
            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="first_name">First Name</label>
                                <input name="first_name" type="text" class="form-control" placeholder="First Name" wire:model="first_name">
                                @error('name')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="last_name">Last Name</label>
                                <input name="last_name" type="text" class="form-control" placeholder="Last Name" wire:model="last_name">
                                @error('name')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>{{ __('Тип') }}</label>
                                <select class="custom-select" wire:model="utype">
                                    <option value="USR" selected>Пользователь</option>
                                    <option value="ADM">Администратор</option>
                                    <option value="KSS">Кассир</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success mt-5">
                                    <input type="checkbox" class="custom-control-input" id="customSwitch3" wire:model.live="status" style="cursor: pointer;">
                                    <label class="custom-control-label" for="customSwitch3" style="cursor: pointer;">
                                        Активирован
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" wire:model="email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" wire:model="password">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" wire:click="createUser">Save changes</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
    <!-- /.modal-dialog -->
 </div>
