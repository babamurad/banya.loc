<div>
    @push('select_js')
        <script>
            //pda net +
            window.addEventListener('closeJobTitleModal', event=> {
                $('#AddJobTitle').modal('hide');
            });
        </script>
        <script>
            //Date picker
            // $('#reservationdate1').datetimepicker({
            //     format: 'DD.MM.yyyy'
            // });
                    
            $('#reservationdate2').datetimepicker({
                format: 'DD.MM.yyyy'
            });

            document.addEventListener('livewire:load', function () {
            $('#reservationdate1').datepicker({
                format: 'yyyy-mm-dd',
            }).on('changeDate', function(e) {
                @this.set('date1', e.format(0, "yyyy-mm-dd"));
            });
            $('#reservationdate2').datepicker({
                format: 'yyyy-mm-dd',
            }).on('changeDate', function(e) {
                @this.set('date2', e.format(0, "yyyy-mm-dd"));
            });
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

            <div>
                <div class="form-group">
                    <label for="date">Выберите дату</label>
                    <input type="text" id="date" class="form-control" placeholder="Выберите дату" autocomplete="off">
                </div>
                <div>
                    Выбранная дата: {{ $date1 }}
                </div>
            </div>
            
            <div class="row mb-2">
                <div class="col-sm-3">
                    <h1>Общая баня</h1>
                    <button type="submit" class="btn btn-success mt-4"  wire:click="toggleNewOrder">
                        Новый Заказ<i class="fas fa-chevron-{{ $visOrder? 'down' : 'up'}} ml-3"></i>
                    </button>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Date1: {{ $date1 }}</label>
                          <div class="input-group date" id="reservationdate1" data-target-input="nearest">
                              <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate1" wire:model.live="date1"
                              onchange="Livewire.emit('setDate', this.value)"
                              >
                              <div class="input-group-append" data-target="#reservationdate1" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                              </div>
                          </div>
                      </div>
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{ $kol->mans }}</h3>

                            <p>Человек в мужской бане</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Date2: {{ $date2 }}</label>
                          <div class="input-group date" id="reservationdate2" data-target-input="nearest">
                              <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate2" wire:model.live="date2">
                              <div class="input-group-append" data-target="#reservationdate2" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                              </div>
                          </div>
                      </div>
                    <!-- small box -->
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>{{ $kol->womans }}</h3>

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
                                   <label for="sum">Сумма</label>
                                   <input type="number" name="sum" class="form-control" placeholder="Сумма" wire:model.live="sum" readonly>
                               </div>
                           </div>
                       </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>Выбор Пола</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="radio1" checked="" wire:model="pol" value="1">
                                        <label class="form-check-label">Мужчина</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="radio1" wire:model="pol" value="2">
                                        <label class="form-check-label">Женщина</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Взрослые</label>
                                    <input type="number" class="form-control" wire:model.live="qtyAdults" min="0">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Дети до 12 лет</label>
                                    <input type="number" class="form-control" wire:model.live="qtyChildren" min="0">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="required-field">{{__('Start Time')}}</label>
                                    <select class="custom-select" wire:model.live="startOrder">
                                        @foreach($time_list  as $times)
                                            <option wire:key='{{$times->id}}'>{{$times->time}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="required-field">{{__('End Time')}}</label>
                                    <select class="custom-select" wire:model.live="endOrder">
                                        @foreach($time_list  as $times)
                                            <option wire:key='{{$times->id}}'>{{$times->time}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label for=""></label>
                                <div class="form-group" ><span>Баня: {{ $sum }} </span></div>
                            </div>
                            <div class="col-sm-3">
                                <label for=""></label>
                                <div class="form-group" ><span>Услуги: {{ $details_sum }} </span></div>
                            </div>
                            <div class="col-sm-3">
                                <label for=""></label>
                                <div class="form-group"><span><strong>Итого:
                                    @if (is_numeric($details_sum) && is_numeric($sum))
                                        {{ $details_sum + $sum }}
                                    @endif                                     
                                </strong> </span></div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-secondary" wire:click="cancelOrder">Cancel</a>
                        <button class="btn btn-secondary float-right" wire:click="closeForm">Close</button>
                        <button type="button" class="btn btn-success float-right mr-1" wire:click="saveOrder">Сохранить</button>

                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <div class="col-md-5">
                <div class="card card-secondary">
                    <div class="card-header">
                            <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#AddJobTitle" @if(!$order) disabled @endif>
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
                                        @if($details)
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
                                        @endif
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
                    <h3 class="card-title">Таблица Общая баня</h3>

                    <div class="card-tools">
                        <div class="row">
                            <div class="form-group mr-1"><label>Выбор</label></div>
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <div class="form-group float-right">
                                    <select class="form-control" wire:model.live="gender">
                                        <option value="">Все</option>
                                        <option value="1">Мужская</option>
                                        <option value="2">Женская</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: 60vh;">
                    <table class="table ">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>Пол</th>
                            <th>Дата</th>
                            <th>Время</th>
                            <th>Взр./Дет.</th>
                            <th>Сумма</th>
                            <th>Действие</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($orders as $order)
                            <tr>
                                <td>{{ $order->num }}</td>
                                <td><span class=" {{ $order->gender == 1? "bg-gradient-lightblue":"bg-gradient-cyan" }}  p-1 rounded">{{ $order->gender == 1? "Man":"Woman" }}</span></td>
                                <td>{{ \Carbon\Carbon::create($order->data)->format('d.m.Y') }}</td>
                                <td>{{ \Carbon\Carbon::parse($order->start)->format('H:i') }} - {{ \Carbon\Carbon::parse($order->end)->format('H:i') }}</td>
                                <td>{{ $order->adults }} / {{ $order->children }}</td>
                                <td>{{ $order->sum }}</td>
                                <td>
                                    <div>
                                        <button type="button" class="btn btn-secondary btn-sm" wire:click="editOrder({{ $order->id }})">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button onclick="confirm('Are you sure want to delete ?') || event.stopImmediatePropagation() " type="button"
                                                class="btn btn-danger btn-sm" wire:click="destroy({{ $order->id }})">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>

                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    {{ $orders->links() }}
                </div>
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>
