<div>
    @push('select2')
        <link href="{{ asset('dist/css/tom-select.css') }}" rel="stylesheet">
        <script src="{{ asset('dist/js/tom-select.complete.min.js') }}"></script>
        <script>
            window.addEventListener('closeModal', event=> {
                $('#CreateClientDialog').modal('hide');
            });

            //$('#add-client').hide();

            $('#vis').click(function(){
                //alert('btn click');
                $('#add-client').toggle();
                $('#sel-client').toggle();
            });

            $('#SaveClient').click(function(){
                //alert('btn click');
                $('#add-client').toggle();
                $('#sel-client').toggle();
            });

            new TomSelect("#select-beast",{
                create: true,
                sortField: {
                    field: "text",
                    direction: "asc"
                }
            });

        </script>
    @endpush
    @include('calendar.create-order')
    @include('client.client-create')
        @if(session('success'))
            <div class="alert alert-success alert-dismissible mt-1" style="margin-bottom: 0%; padding-top:0.5rem; padding-bottom:0.5rem; ">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h5><i class="icon fas fa-check"></i> {{ session('success') }}</h5>
            </div>
        @endif
    <div class="content-header">
        <div class="form-group d-flex">
            @foreach($departments as $department)
            <div class="custom-control custom-radio mr-3">
                <input class="custom-control-input" type="radio" id="customRadio{{$department->id}}" name="customRadio"
                       wire:model="department_id" wire:key="department-{{$department->id}}" wire:click="DepartmentChecked()" value="{{$department->id}}">
                <label for="customRadio{{$department->id}}" class="custom-control-label" style="cursor: pointer;">{{$department->name}}</label>
            </div>
            @endforeach
        </div>
        <div class="container-fluid">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-8">
                        <div class="card p-2">
                            <h4>{{$monthStr[$mon-1] . ' ' . $year}}</h4>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">{{__('Select Year')}}</label>
                                        <input type="number" class="form-control" value="2023" step="1" wire:model.live="year">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{__('Select Month')}}</label>
                                        <select class="form-control" wire:model.live="mon">
                                            @for($i=1; $i<=12; $i++)
                                                <option value="{{$i}}" wire:key="{{$i}}">{{ $monthStr[$i-1] }} </option>
                                            @endfor
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Кассиры</label>
                                        <select class="form-control">
                                            <option value="">Выберите кассира</option>
                                            @foreach ($users as $user)
                                                <option value="{{ $user->id }}">{{ $user->first_name . ' ' . $user->last_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-2">
                            <div class="card bg-gradient-blue p-3" style="cursor: pointer;" data-toggle="modal" data-target="#CreateOrder">
                                <div class="card-title">Заказы по часам</div>
                                <h5 class="pl-2 pr-2 pt-2">{{ \Carbon\Carbon::create($data)->format('d.m.Y') }}</h5>
                            </div>
                        <div class="row">
                            <div class="col-md-6">
                                <button class="btn btn-outline-success" wire:click="newOrder()">Новый заказ</button>
                                {{--                                <a href="{{ route('order-create', ['data'=>(\Carbon\Carbon::create($data)->format('Y-m-d')), 'dep_id'=>$department_id, 'number'=>$num]) }}"--}}
                                {{--                                   class="btn btn-sm btn-success" wire:navigate>Create Order--}}
                                {{--                                </a>--}}
                                {{--                                    <button class="btn btn-block btn-success"--}}
                                {{--                                            data-toggle="modal" data-target="#CreateClientDialog">--}}
                                {{--                                        <i class="fas fa-plus mr-1"></i> {{__('Add Client')}}--}}
                                {{--                                    </button>--}}
                            </div>
                            <div class="col-md-6">


                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-8">
            <div class="row seven-cols">
                @foreach($weekString as $weekday)
                    <div class="cal-md-1" wire:key="{{$weekday}}">
                        <div class="card bg-gray mb-1">
                            <div class="text-center">
                                {{$weekday}}
                            </div>
                        </div>
                    </div>
                @endforeach
                @foreach($daysM as $day)
                    @php $den=\Carbon\Carbon::create($day)->format('d.m.Y'); $den2=\Carbon\Carbon::create($data)->format('d.m.Y') @endphp
                    <div class="cal-md-1" wire:key="{{$day}}">
                        <div class="card
                        {{ $mon != \Carbon\Carbon::create($day)->format('m') ? 'bled' : ''}}
                        {{ $den == \Carbon\Carbon::create($data)->format('d.m.Y')? 'bg-danger disabled ':'bg-primary'}}
                        {{ $day == \Carbon\Carbon::create()->now()->format('d.m.Y')? 'bg-success disabled ':'' }}"
                             style="cursor: pointer;"
                             wire:click="viewDay('{{$day}}')" wire:change="{{$day}}">
                            <div class="card-body">
                                <div class="card-title text-center">
                                    <h4>{{\Carbon\Carbon::create($day)->format('d')}}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>


        </div>

        <div class="col-md-4">
            <div class="card card-default pt-2"  style="max-height: 35%; overflow: scroll;">
                <div class="card-body p-0">
            <ul>
                @foreach($tb_times as $tb_time)
                    <li class="border-bottom" wire:key="{{$tb_time['id']}}">
                        <div class="row">
                            <div class="col-md-2 bg-warning">
                                <span class="pl-3"><strong>{{ substr($tb_time['time'], 0, 5) }}</strong>   </span>
                            </div>
                            <div class="col-md-10 {{ $tb_time['busy']==1? 'bg-warning':'' }}">

                                    @if($tb_time['busy']==1)
                                        <button type="button" class="btn btn-sm btn-outline-info">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary btn-sm">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button onclick="confirm('Are you sure want to delete ?') || event.stopImmediatePropagation() " type="button"
                                                class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    @endif

                            </div>
                        </div>

                    </li>
                @endforeach
            </ul>
                </div>
            </div>
        </div>
    </div>


</div>
