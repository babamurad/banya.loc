<div>
    <div class="card card-default"  style="max-height: 35%; overflow: scroll;">

        <div class="card-body p-0 card-default">
            <div class="card-title">{{$dayData}}</div>
            <div class="card-body">
                <!-- THE CALENDAR -->
                @php $k=0 @endphp
                <ul>
                    @for ($i=$startTime; $i<=$endTime; $i+=900)
                        @php $bkTime=date('H:i:s', $i) @endphp
                        <li class="border-bottom my-1" >
                            <div class="row">
                                <div class="col-md-1">
                                    <span class="ml-2">{{substr($bkTime, 0, 5)}}</span>
                                </div>
                                <div class="col-md-11">
                                    @foreach($bookings as $booking)
                                        @php
                                            $bkStartTime = \Carbon\Carbon::create($booking->startOrder)->toTimeString();
                                            $bkEndTime = \Carbon\Carbon::create($booking->endOrder)->toTimeString();
                                        @endphp
                                        @if(($bkTime>=$bkStartTime) && ($bkTime<=$bkEndTime))
                                            <h5 class="bg-warning" wire:key="{{$booking->id}}"> - </h5>
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </li>

                    @endfor
                </ul>
            </div>
        </div>
        <!-- /.card-body -->
    </div>
</div>
