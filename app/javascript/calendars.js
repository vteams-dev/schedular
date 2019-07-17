import { Calendar } from '@fullcalendar/core';
import timeGridPlugin from '@fullcalendar/timegrid';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new Calendar(calendarEl, {
        plugins: [ timeGridPlugin,dayGridPlugin, interactionPlugin ],

        selectable: true,
        timeZone: 'UTC',
        editable: true,
        selectHelper: true,
        eventLimit: true,

        header: {
            center: 'dayGridMonth,timeGridSevenDay,dayGridFourDay,dayGridOneDay' // buttons for switching between views
        },

        events: '/calendars/4/events.json',


        views: {
            dayGridOneDay: {
                type: 'dayGrid',
                duration: { days: 1 },
                buttonText: 'Today'
            },
            dayGridFourDay: {
                type: 'dayGrid',
                duration: { days: 4 },
                buttonText: '4 day'
            },

            dayGridMonth: {
                buttonText: 'Month'
            },

            timeGridSevenDay: {
                type: 'timeGrid',
                duration: { days: 7 },
                buttonText: 'Week'
            }

        },

        eventClick: function(info) {
            alert('Event: ' + info.event.title);
            //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
            //alert('View: ' + info.view.type);

            // change the border color just for fun
            info.el.style.borderColor = 'red';
        }


        // events: [
        //     {
        //         id: '1',
        //         title: 'my event',
        //         start: '2019-07-01'
        //     }
        // ]
});

    //var event = calendar.getEventById('1') // an event object!
    //var start = event.start // a property (a Date object)
    //console.log(start.toISOString()) // "2018-09-01T00:00:00.000Z"

    calendar.render();
});
