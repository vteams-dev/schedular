import $ from 'jquery';
import { Calendar } from '@fullcalendar/core';
import dayGrid from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import list from '@fullcalendar/list';
import  moment, {start,end} from 'moment';


let start_range_picker = (selectionInfo) => {
    $('.start-range-picker').each(function(){
        $(this).daterangepicker({
            singleDatePicker: true,
            timePicker: true,
            timePickerIncrement: 1,
            startDate: moment(selectionInfo.start),
            "opens": "right",
        }, function(start) {
            $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
        });
    });
};
let end_range_picker = (selectionInfo) => {
    $('.end-range-picker').each(function(){
        $(this).daterangepicker({
            singleDatePicker: true,
            timePicker: true,
            timePickerIncrement: 1,
            startDate: moment(selectionInfo.start),
            "opens": "right",
        }, function(start) {
            $('.end_hidden').val(start.format('YYYY-MM-DD HH:mm'));
        });
    });
};

document.addEventListener('DOMContentLoaded',  () => {
    var baseUrl = window.location.href ;

    if ($('#calendar').length > 0) {
        window.calendar = new Calendar(document.getElementById('calendar'), {
            plugins: [ dayGrid, list, interactionPlugin ],
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,listYear'
            },
            timeZone: 'UTC',
            selectable: true,
            editable: true,
            selectHelper: true,
            eventLimit: true,
            events: baseUrl + '/events.json',

            select: (selectionInfo) => {
                $.ajax({
                    type: 'GET',
                    url: baseUrl + '/events/new',
                    success: () => {
                        start_range_picker(selectionInfo);
                        end_range_picker(selectionInfo);
                    }
                });
            },

            eventDrop: (eventDropInfo) => {
                var EventData = {
                    event: {
                        start_time: eventDropInfo.event.start,
                        end_time: eventDropInfo.event.end,
                    }
                };
                $.ajax({
                    url: baseUrl + '/events/' + eventDropInfo.oldEvent.id,
                    data: EventData,
                    type: 'PATCH'
                });
            },

            eventClick: (event) => {
                $.ajax({
                    type: 'GET',
                    url: baseUrl + '/events/' + event.event.id + '/edit',
                    success: () => {
                        start_range_picker(event.event);
                        end_range_picker(event.event);
                    }
                });
            },

        });
        calendar.render();
    }
});

