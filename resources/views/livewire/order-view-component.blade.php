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
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-left">
                        <li class="breadcrumb-item"><a href="{{ route('day-events', ['data' => session()->get('data'), 'dep_id' => session()->get('dep_id')]) }}" wire:navigate> Назад к заказам </a></li>
                        <li class="breadcrumb-item active"> Просмотр Заказа </li>
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
                <h5>Просмотр Заказа</h5>
                {{$order->department->name}} / {{ $order->data }}
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
                            <label class="required-field">Выберите отдел - {{$order->department->name}}</label>
                            <input class="form-control" type="text" wire:model="dep_name" readonly value="{{$order->department->name}}">
                            {{--                            <select class="form-control" wire:model.live="depart_id">--}}
                            {{--                                <option value="">Выберите отдел</option>--}}
                            {{--                                @foreach($departments as $department)--}}
                            {{--                                    <option {{ $dep_name->id == $department->id ? 'selected':'' }} value="{{$department->id}}"--}}
                            {{--                                        wire:key="{{$department->id}}"> {{$department->name}}--}}
                            {{--                                    </option>--}}
                            {{--                                @endforeach--}}
                            {{--                            </select>--}}
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
                            <input type="number" class="form-control" placeholder="Сумма" wire:model.live="sum" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">

                        <div class="d-flex mb-2">
                            <label class="card-title w-100 d-flex required-field">
                                 Клиент - {{ $order->client->first_name . ' ' . $order->client->last_name }}
                            </label>
                            <button class="btn btn-sm text-green d-none" data-toggle="modal" data-target="#CreateOrderClient"><i
                                    class="fas fa-plus"></i>
                            </button>
                        </div>
                        <div class="d-none" style="position:relative">
                            <input wire:model.live="searchClient" class="form-control relative" type="text"
                                   placeholder="Search..."/>
                        </div>
                        <div class="d-none" style="position:absolute; z-index:100">
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
                            <select class="form-control md-form h-100" name="client-value" wire:model="clients_id" disabled>
                                <option value="0" selected>Выберите клиента</option>
                                @foreach($clients as $client)
                                    <option
                                        value="{{ $client->id }}" wire:key="{{$client->id}}">
                                        {{ $client->first_name . ' ' .$client->last_name }} </br> {{ '  Tel:  ' . $client->phone }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
{{--                        {{$startOrder}} - {{$endOrder}}--}}
                        <div class="form-group ">
                            <label class="required-field">{{__('Start Time')}}</label>
                            <select class="custom-select" wire:model.live="startOrder" disabled>
                                @foreach($time_list  as $times)
                                    <option class="{{ $times->busy? 'bg-danger disabled color-palette':'' }}" {{ $times->busy? 'disabled':'' }} wire:key="{{ $times->id }}" wire:key="{{$times->id}}">{{$times->time}}</option>
                                @endforeach
                            </select>
                        </div>
                        <p>Total summ:</p>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="required-field">{{__('End Time')}}</label>
                            <select class="custom-select" wire:model.live="endOrder" disabled>
                                @foreach($time_list  as $times)
                                    <option class="{{ $times->busy? 'bg-danger disabled color-palette':'' }}" {{ $times->busy? 'disabled':'' }} wire:key="{{ $times->id }}" wire:key="{{$times->id}}">{{$times->time}}</option>
                                @endforeach
                            </select>
                        </div>
                        <p>Total sum</p>
                    </div>
                    <div class="mt-1">
                        {{-- <a class="btn btn-sm btn-default" href="{{ route('day-events', ['data' => session()->get('data'), 'dep_id' => session()->get('dep_id')]) }}" > Назад </a> --}}
                        <a class="btn btn-sm btn-default" href="{{ route('day-events', ['data' => session()->get('data'), 'dep_id' => session()->get('dep_id')]) }}"" > Назад </a>
                        <a class="btn btn-sm btn-primary ml-3" href="#" wire:click='update'> Сохранить </a>
                        <a class="btn btn-sm btn-secondary ml-3" href="{{ route('order-edit', ['id' => $num]) }}" > Редактировать </a>
                        
                    </div>

                </div>


            </div>
        </div>
        <div class="card">
            <div class="card-title d-none">
                <div class="form-group">
                    <button class="btn btn-sm btn-outline-info m-3" data-toggle="modal" data-target="#AddJobTitle">
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
                                @if($order->order_details->count()>0)
                                    @foreach ($order->order_details as $detail)
                                        <tr wire:key="{{$detail->id}}">
                                            <td>{{$detail->name}}</td>
                                            <td>{{$detail->qty}} </td>
                                            <td>{{$detail->price}} {{__('man.')}} </td>
                                            <td>{{$detail->qty*$detail->price}} {{__('man.')}} </td>
                                            <td>
                                                <div>
                                                    <button type="button" class="btn btn-secondary btn-sm d-none"
                                                            data-toggle="modal"
                                                            data-target="#EditJobTitleDialog"
                                                            wire:click='edit({{$detail->id}})'>
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button
                                                        onclick="confirm('Are you sure want to delete {{$detail->name}}?') || event.stopImmediatePropagation() "
                                                        type="button" class="btn btn-danger btn-sm d-none"
                                                        wire:click="destroy({{$detail->id}})">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>

                            </table>

                        </div>
                    </div>
                </div>

            </div>

