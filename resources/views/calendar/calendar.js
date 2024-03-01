
    document.addEventListener('livewire:initialized', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'timeGridWeek',
            timeZone: 'UTC+5',
            locale: 'ru',
            timeFormat: {
                hour: 'numeric',
                minute: '2-digit',
                meridiem: true
            },
            allDaySlot: false,
            minTime: "00:00:00",
            maxTime: "24:00:00",
            slotDuration: "00:15:0",
            editable: true,
            selectable: true,
            events: @json($events),
            select: function(data) {
                var event_name = prompt('Event Name:');

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
        });
        calendar.render();
        console.log(events);
    });

    select: function () {
        $('#EventCreate').modal('toggle');
        $('#saveBtn').click(function () {
            var event_name = 'order';
            var client_id = $('#client').val();
            console.log(client_id);
            $('#EventCreate').modal('hide');
        })
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
            })
    }
