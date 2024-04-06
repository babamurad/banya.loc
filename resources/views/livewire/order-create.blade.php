<div>
    @push('select_js')
    <script>
      //pda net +
      window.addEventListener('closeJobTitleModal', event=> {
          $('#AddJobTitle').modal('hide');
      });
      window.addEventListener('closeModal', event=> {
          $('#CreateOrderClient').modal('hide');
      });
    </script>
    @endpush
    @include('orders.create-client')
    @include('orders.add-jobtitle')
    @include('orders.edit-jobtitle')

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
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-left">
                            <li class="breadcrumb-item"><a href="{{ route('day-events', ['data' => session()->get('data'), 'dep_id' => session()->get('dep_id')]) }}"  wire:navigate> {{__('Back to Day Events')}} </a></li>
                            <li class="breadcrumb-item active"> {{__('Create Order')}} </li>
                        </ol>
                    </div>
                    <div class="col-sm-6">
                        @include('components.alerts')
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h5>Create Order</h5>
                {{$dep_name}} / {{ $data }}
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Номер</label>
                            <input class="form-control" type="text" placeholder="Number" wire:model="num" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="department" class="required-field">Выберите отдел - {{$dep_name}} {{ $departments->count() }}</label>
                            <select class="form-control md-form h-100" name="department" id="department" wire:model="department_id" disabled>
                                @foreach($departments as $department)
                                    <option value="{{ $department->id }}" wire:key="{{ $department->id }}">{{ $department->name }}</option>
                                @endforeach
                            </select>
{{--                            <input class="form-control" type="text" wire:model="dep_name" readonly value="{{$dep_name}}">--}}
                        </div>
                    </div>
                    <div class="col md-2">
                        <div class="form-group">
                            <label for="jprice">Цена</label>
                            <input type="number" class="form-control" id="jprice" placeholder="Price" wire:model.live="jprice" readonly>
                        </div>
                    </div>
                    <div class="col md-2">
                        <div class="form-group">
                            <label for="jqty">Кол-во</label>
                            <input type="number" class="form-control" id="jqty" placeholder="Кол-во" wire:model.live="jqty" readonly>
                        </div>
                    </div>
                    <div class="col md-4">
                        <div class="form-group">
                            <label for="jsum">Сумма</label>
                            <input type="number" class="form-control" placeholder="Сумма" wire:model.live="jsum" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="d-flex">
                            <label class="card-title w-100 d-flex required-field">
                                {{ __('Clients') }} - {{$clients_id}}
                            </label>
                            <button class="btn btn-sm text-green" data-toggle="modal" data-target="#CreateOrderClient"><i
                                    class="fas fa-plus"></i>
                            </button>
                        </div>
                        <div style="position:relative">
                            <input wire:model.live="searchClient" class="form-control relative" type="text"
                                   placeholder="Search..."/>
                        </div>
                        <div style="position:absolute; z-index:100">
                            @if(strlen($searchClient)>2)
                                @if(count($clients)>0)
                                    <ul class="list-group">
                                        @foreach($clients as $client)
                                            <li class="list-group-item list-group-item-action" style="cursor: pointer;"
                                                wire:click="selectClient({{$client->id}})" wire:key="{{$client->id}}">
                                                <span> {{ $client->first_name . ' ' .$client->last_name . ' ' . $client->phone }} </span>
                                            </li>
                                        @endforeach
                                    </ul>
                                @else
                                    <li class="list-group-item">Found nothing...</li>
                                @endif
                            @endif
                        </div>


                        <div class="text-center mt-1-half">
                            <select class="form-control md-form h-100" name="client-value" wire:model.live="clients_id">
                                <option value="0" selected>Выберите клиента</option>
                                @foreach($clients as $client)
                                    <option
                                        value="{{ $client->id }}" wire:key="{{$client->id}}">
                                        {{ $client->first_name . ' ' .$client->last_name }}  {{ '  Tel:  ' . $client->phone }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="required-field">{{__('Start Time')}} - {{$startOrder}}</label>
                            <select class="custom-select" wire:model.live="startOrder">
                                @foreach($time_list  as $times)
                                    <option class="{{ $times->busy? 'bg-danger disabled color-palette':'' }}" {{ $times->busy? 'disabled':'' }} wire:key='{{$times->id}}'>{{$times->time}}</option>
                                @endforeach
                            </select>
                        </div>
                        <p>Всего: {{ number_format($jsum, 2, ',', ' ') }}</p>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="required-field">{{__('End Time')}} - {{$endOrder}}</label>
                            <select class="custom-select" wire:model.live="endOrder">
                                @foreach($time_list  as $times)
                                    <option class="{{ $times->busy? 'bg-danger disabled color-palette':'' }}" {{ $times->busy? 'disabled':'' }} wire:key='{{$times->id}}'>{{$times->time}}</option>
                                @endforeach
                            </select>
                        </div>
                        <p>Услуги: {{ number_format($details_sum, 2, ',', ' ') }} </p>
                        <p><strong>Итого: {{ number_format($details_sum + $jsum, 2, ',', ' ') }}</strong> </p>
                    </div>
                    <button class="btn btn-sm btn-default mr-3" wire:click='delIfEmpty' > Назад </button>
                    <button
                        class="btn btn-sm btn-success" wire:click="SaveOrder">Save Order
                    </button>
                </div>


            </div>
        </div>
        <div class="card">
            <div class="card-title">
                <div class="form-group">
                <button class="btn btn-sm btn-outline-info m-3" data-toggle="modal" data-target="#AddJobTitle" >
                    <i class="fas fa-plus mr-2"></i>Add
                </button>
                </div>
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

</div>
