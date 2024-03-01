<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    @push('calendar-css')

    @endpush
    @push('calendar-js')
    <script src='{{ asset('dist/js/index.global.min.js') }}'></script>
    @endpush

    @include('calendar.event-create')

    <livewire:search-clients />

    <div  wire:ignore id="calendar"></div>

        <script>
            document.addEventListener('livewire:initialized', function() {

                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    themeSystem: 'bootstrap',
                    initialView: 'timeGridWeek',
                    timeZone: 'UTC+5',
                    locale: 'ru',
                    allDaySlot: false,
                    slotMinTime: '00:00:00',
                    slotMaxTime: '24:00:00',
                    defaultRangeSeparator: ' - ',
                    dayHeaders: true,
                    weekends: true,

                    slotDuration: "00:15:0",
                    editable: true,
                    selectable: true,
                    events: @json($events),

                    select: function () {
                    console.log(events.title);
                    }

                });
                calendar.render();
                 // console.log('events');
            });
        </script>
</div>
