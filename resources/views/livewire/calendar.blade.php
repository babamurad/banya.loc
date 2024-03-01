<div>
    @push('calendar-js')
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    @endpush

        <livewire:search-clients />
        <input type="text" wire:model="department_id">
    <div wire:ignore.self id='calendar'></div>

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
                select: function(data) {
                    var event_name = prompt('Event Name:');
                    if (!event_name) {
                        return;
                    }
                @this.newEvent(event_name, data.start.toISOString(), data.end.toISOString())
                    .then(
                        function(id) {
                            calendar.addEvent({
                                id: id,
                                title: event_name,
                                start: data.startStr,
                                end: data.endStr,
                            });
                            calendar.unselect();
                        });
                },
                eventDrop: function(data) {
                    console.log(data.event.id)
                @this.updateEvent(
                    data.event.id,
                    data.event.name,
                    data.event.start.toISOString(),
                    data.event.end.toISOString()).then(function() {
                    alert('moved event');
                })
                },
                eventResize:function(data) {
                    console.log(data.event.id)
                @this.updateEvent(
                    data.event.id,
                    data.event.name,
                    data.event.start.toISOString(),
                    data.event.end.toISOString()).then(function() {
                    //alert('Resize event');
                })
                }
            });
            calendar.render();
        });
    </script>
</div>
