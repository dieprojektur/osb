$(document).ready(function() {
  $.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
  var calendar = $('#calendar').fullCalendar({
    theme: false,
    selectable: true,
    editable: true,
    events: "/open_spaces.json",
    header: {
      left: 'title',
      center: 'month agendaWeek agendaDay',
      right: 'today prev,next'
    },
    eventResize: function (event, dayDelta, minuteDelta){
                 console.log(event);
                 $.ajax({
                   type: 'put',
                   url: '/open_spaces/' + event.id,
                   data: {'open_space[id]': event.id, 'open_space[start]': event.start.format('isoDateTime'), 'open_space[end]': event.end.format('isoDateTime')},
                   dataType: 'script',
                   complete: function(xhr, status) {
                     $('#calendar').fullCalendar('refetchEvents');
                   }
                 });
               },
    eventDrop: function (event, dayDelta, minuteDelta, allDay){
                 console.log(event);
                 $.ajax({
                   type: 'put',
                   url: '/open_spaces/' + event.id,
                   data: {'open_space[id]': event.id, 'open_space[start]': event.start.format('isoDateTime'), 'open_space[end]': event.end.format('isoDateTime'), 'open_space[allDay]': allDay},
                   dataType: 'script',
                   complete: function(xhr, status) {
                     $('#calendar').fullCalendar('refetchEvents');
                   }
                 });
               },
    eventClick: function(event) {
              var form = $('#dialog').dialog({
                title: 'Edit Event', 
                modal: true,
              }).load('/open_spaces/'+event.id+'/edit', function() {
                form = $(this).find('form');
                form.find(':text:first').focus();
                btn = form.find(':submit');
                var txt = btn.val();
                btn.remove();
                var buttons = {};
                buttons[txt] = function() {
                  $.ajax({
                    type: form.attr('method'),
                    url: form.attr('action'),
                    data: form.serialize(),
                    dataType: 'script',
                    complete: function(xhr, status) {
                      $('#calendar').fullCalendar('refetchEvents');
                    }
                  });
                  $(this).dialog('close');
                  $(this).dialog('destroy');
                };
                buttons['Cancel'] = function() {
                  $(this).dialog('close');
                  $(this).dialog('destroy');
                }
                $(this).dialog('option', 'buttons', buttons);
                $('.datepicker').datepicker();
              });

                  return false;
                },
    select: function(startDate, endDate, allDay, jsEvent, view) {
              var form = $('#dialog').dialog({
                title: 'Add Event', 
                modal: true
              }).load('/open_spaces/new', function() {
                form = $(this).find('form');
                form.find(':text:first').focus();
                starts_on = $('#open_space_start')
                starts_on.val(startDate.format('isoDate'));
                ends_on = $('#open_space_end')
                ends_on.val(endDate.format('isoDate'));
                all_day = $('#open_space_allDay')
                all_day.attr('checked', allDay);
                btn = form.find(':submit');
                var txt = btn.val();
                btn.remove();
                var buttons = {};
                buttons[txt] = function() {
                  $.ajax({
                    type: form.attr('method'),
                    url: form.attr('action'),
                    data: form.serialize(),
                    dataType: 'script',
                    complete: function(xhr, status) {
                      $('#calendar').fullCalendar('refetchEvents');
                    }
                  });
                  $(this).dialog('close');
                  $(this).dialog('destroy');
                };
                buttons['Cancel'] = function() {
                  $(this).dialog('close');
                  $(this).dialog('destroy');
                }
                $(this).dialog('option', 'buttons', buttons);
                $('.datepicker').datepicker();
              });
            }
  });
});
