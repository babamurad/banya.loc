<div>
    @push('select_js')
        <script>
            //pda net +
            window.addEventListener('closeJobTitleModal', event=> {
                $('#AddJobTitle').modal('hide');
            });
        </script>
    @endpush

    @include('orders.add-jobtitle')
    @include('components.alerts')
    <div wire:ignore.self class="modal fade" id="ConfirmDelete" role="viewDialog" aria-hidden="true">
        <div class="modal-dialog card" style="max-width: 25%;">
            <div class="modal-content">

                <div class="modal-header primary" style="background-color: #007bff;">
                    <h4 class="modal-title text-white ">{{ __('Удалить заказ')}}</h4>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Хотитие удалить заказ № </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="submit" class="btn btn-danger" wire:click="destroy"> {{__('Удалить')}} </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"> {{__('Закрыть')}} </button>
                </div>
                <!-- /modal-content  -->

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>



    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-3">
                    <h1>Общая баня</h1>
                    <button type="submit" class="btn btn-success mt-4"  wire:click="addOrder">
                        Новый Заказ<i class="fas fa-chevron-{{ $visOrder? 'down' : 'up'}} ml-3"></i>

{{--                        --}}
                    </button>

                </div>
                <div class="col-sm-3">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>51</h3>

                            <p>Человек в мужской бане</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <!-- small box -->
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>44</h3>

                            <p>Человек в женской бане</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Общая баня</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content {{ $visOrder? 'd-none' : '' }}">
        <div class="row">
            <div class="col-md-7">
                <div class="card card-secondary">
                    <div class="card-header">
                        <h3 class="card-title">Новый Заказ - Общий Отдел</h3>
                    </div>
                    <div class="card-body">
                       <div class="row">
                           <div class="col-sm-2">
                               <div class="form-group">
                                   <label>Номер</label>
                                   <input class="form-control" type="text" placeholder="Number" readonly wire:model="num">
                               </div>
                           </div>
                           <div class="col md-2">
                               <div class="form-group">
                                   <label for="jprice">Цена Взр. 1 час</label>
                                   <input type="text" class="form-control" name="jprice" readonly value="70 ман.">
                               </div>
                           </div>
                           <div class="col md-2">
                               <div class="form-group">
                                   <label for="cprice">Цена дет. 1 час</label>
                                   <input type="text" class="form-control" name="cprice" readonly value="30 ман.">
                               </div>
                           </div>
                           <div class="col md-2">
                               <div class="form-group">
                                   <label for="jqty">Время (час)</label>
                                   <input type="number" class="form-control" id="jqty" placeholder="Кол-во" wire:model.live="qty" readonly>
                               </div>
                           </div>
                           <div class="col md-4">
                               <div class="form-group">
                                   <label for="jsum">Сумма</label>
                                   <input type="number" class="form-control" placeholder="Сумма" wire:model.live="sum" readonly>
                               </div>
                           </div>
                       </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required-field">{{__('Start Time')}} - {{$startOrder}}</label>
                                    <select class="custom-select" wire:model.live="startOrder">
                                        @foreach($time_list  as $times)
                                            <option wire:key='{{$times->id}}'>{{$times->time}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required-field">{{__('End Time')}} - {{$endOrder}}</label>
                                    <select class="custom-select" wire:model.live="endOrder">
                                        @foreach($time_list  as $times)
                                            <option wire:key='{{$times->id}}'>{{$times->time}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Взрослые</label>
                                    <input type="number" class="form-control" wire:model.live="qtyAdults">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Дети до 12 лет</label>
                                    <input type="number" class="form-control" wire:model.live="qtyChildren">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label for=""></label>
                                <div class="form-group" ><span>Услуги: {{ number_format($details_sum, 2, ',', ' ') }} </span></div>
                            </div>
                            <div class="col-sm-3">
                                <label for=""></label>
                                <div class="form-group"><span><strong>Итого: {{ number_format($details_sum + $jsum, 2, ',', ' ') }}</strong> </span></div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-secondary" wire:click="cancelOrder">Cancel</a>
                        <button type="button" class="btn btn-success float-right" wire:click="saveOrder">Сохранить</button>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <div class="col-md-5">
                <div class="card card-secondary">
                    <div class="card-header">
                            <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#AddJobTitle" >
                                <i class="fas fa-plus mr-2"></i>Добавить Услугу
                            </button>
                    </div>
                    <div class="card-body">
                        <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"></div>
                                <div class="col-sm-12 col-md-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">

                                    <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                                           aria-describedby="example2_info">
                                        <thead>
                                        <tr>
                                            <th>
                                                <strong> ID </strong>
                                            </th>
                                            <th>
                                                <strong> {{__('Service Name')}} </strong>
                                            </th>
                                            <th>
                                                <strong> {{__('Quantity')}} </strong>
                                            </th>
                                            <th>
                                                <strong> {{__('Price')}} </strong>
                                            </th>
                                            <th>
                                                <strong> {{__('Sum')}} </strong>
                                            </th>
                                            <th class="sorting"> {{__('Action')}} </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($details as $detail)
                                            <tr wire:key="{{$detail->id}}">
                                                <td>{{$detail->order->id }}</td>
                                                <td>{{$detail->id}}-{{$detail->name}}-{{ $detail->employe->name }}</td>
                                                <td>{{$detail->qty}} </td>
                                                <td>{{$detail->price}} {{__('man.')}} </td>
                                                <td>{{$detail->qty*$detail->price}} {{__('man.')}} </td>
                                                <td>
                                                    <div>
                                                        <button
                                                            onclick="confirm('Are you sure want to delete {{$detail->name}}?') || event.stopImmediatePropagation() "
                                                            type="button" class="btn btn-danger btn-sm"
                                                            wire:click="destroy({{$detail->id}})">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>

                                    </table>

                                </div>
                            </div>
                        </div>
                        <input type="submit" value="Сохранить" class="btn btn-success float-right">
                        <a href="#" class="btn btn-secondary">Cancel</a>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-12 mt-2">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Fixed Header Table</h3>

                    <div class="card-tools">
                        <div class="row">
                            <div class="form-group mr-1"><label>Выбор</label></div>

                            <div class="input-group input-group-sm" style="width: 150px;">
                                <div class="form-group float-right">
                                    <select class="form-control">
                                        <option>Все</option>
                                        <option>Мужская</option>
                                        <option>Женская</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: 300px;">
                    <table class="table table-head-fixed text-nowrap">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>183</td>
                            <td>John Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-success">Approved</span></td>
                        </tr>
                        <tr>
                            <td>219</td>
                            <td>Alexander Pierce</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-warning">Pending</span></td>
                        </tr>
                        <tr>
                            <td>657</td>
                            <td>Bob Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-primary">Approved</span></td>
                        </tr>
                        <tr>
                            <td>175</td>
                            <td>Mike Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-danger">Denied</span></td>
                        </tr>
                        <tr>
                            <td>134</td>
                            <td>Jim Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-success">Approved</span></td>
                        </tr>
                        <tr>
                            <td>494</td>
                            <td>Victoria Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-warning">Pending</span></td>
                        </tr>
                        <tr>
                            <td>832</td>
                            <td>Michael Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-primary">Approved</span></td>
                        </tr>
                        <tr>
                            <td>982</td>
                            <td>Rocky Doe</td>
                            <td>11-7-2014</td>
                            <td><span class="tag tag-danger">Denied</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>
