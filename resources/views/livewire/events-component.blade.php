<div>

    <div>
        @include('calendar.create-order')
        <div class="col-md-4">@include('components.alerts')</div>
        <script>
            $('.timepicker').timepicker({
                timeFormat: 'h:mm p',
                interval: 60,
                minTime: '10',
                maxTime: '6:00pm',
                defaultTime: '11',
                startTime: '10:00',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        </script>
{{--        @foreach($bookings as $booking)--}}
{{--            <p>{{$booking->startOrder.' '.$booking->endOrder}}</p>--}}
{{--        @endforeach--}}
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="card pt-2 pl-2">
                            <h4>{{$monthStr[$mon-1] . ' ' . $year}} </h4>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">{{__('Select Year')}}</label>
                                        <input type="number" class="form-control" value="2023" step="1" wire:model.live="year">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>{{__('Select Month')}}</label>
                                        <select class="form-control" wire:model.live="mon">
                                            @for($i=1; $i<=12; $i++)
                                                <option value="{{$i}}" wire:key="{{$i}}">{{ $monthStr[$i-1] }} </option>
                                            @endfor
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>{{__('Select Department')}}</label>
                                        <select class="form-control" wire:model.live="department_id" wire:model="">
                                            <option value="0">-- {{ __('Select Department') }} --</option>
                                            @foreach($departments as $department)
                                                <option value="{{$department->id}}" wire:key="{{$department->id}}">{{ $department->name }} </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-2">
                                    <div class="card bg-danger" style="cursor: pointer;" data-toggle="modal" data-target="#CreateOrder">
                                        <h5 class="pl-2 pr-2 pt-2">{{$data}}</h5>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#CreateOrder">{{ __('Add Order') }}<i class="fas fa-calendar-plus ml-2"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


           <div class="row">
               <div class="col-md-6">
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
               <div class="col-md-6">
{{--                   <livewire:day-time-component :dayData="$dayData" />--}}
                   <div class="card card-default"  style="max-height: 35%; overflow: scroll;">

                       <div class="card-body p-0">
                           <!-- THE CALENDAR -->
                           @php $k=0 @endphp
                           <ul>
                               @for ($i=$startTime; $i<=$endTime; $i+=900)
                                   @php $bkTime=date('H:i:s', $i) @endphp
                                   <li class="border-bottom" wire:key="{{$i}}">
                                       <div class="row">
                                           <div class="col-md-1">
                                               <span class="ml-2">{{substr($bkTime, 0, 5)}}</span>
                                           </div>
                                           <div class="col-md-11">
                                               @foreach($orders as $order)
                                                   @php
                                                       $bkStartTime = \Carbon\Carbon::create($order['startOrder'])->toTimeString();
                                                       $bkEndTime = \Carbon\Carbon::create($order['endOrder'])->toTimeString();
                                                   @endphp
                                                   @if(($bkTime>=$bkStartTime) && ($bkTime<=$bkEndTime))
                                                       <h5 class="bg-warning" wire:key="{{$order['id']}}"> - </h5>
                                                   @endif
                                               @endforeach
                                           </div>
                                       </div>
                                   </li>
                               @endfor
                           </ul>
                       </div>
                       <!-- /.card-body -->
                   </div>
               </div>
           </div>
    </div>

</div>
