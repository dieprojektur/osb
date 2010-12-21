$(document).ready(function() {
function updateEventDialog(url, calendar) {
  var form = $('#dialog').dialog({
    title: 'Edit', 
    modal: true,
    autoOpen: false,
  }).load(url, function() {
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
          if (calendar) {
            calendar.fullCalendar('refetchEvents');
          }
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
    $(this).dialog('open');
    $('.datepicker').datepicker();
  });
};
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
    eventRender: function (event, element, view) {
                   buttonwrap = element.find(':last-child').first().after('<div class="outerbutton"><div id="buttonwrap_'+event.id+'"><button></button><button></button></div></div>');
                   $('#buttonwrap_'+event.id).find('button:first').button({
                     icons: {primary: "ui-icon-gear"}, 
                     text: false
                   }).next().button({
                     icons: {primary: "ui-icon-cancel"}, 
                     text: false
                   });
                   $('#buttonwrap_'+event.id).find('button:first').qtip({
                     content: "Edit Event"
                   }).next().qtip({
                     content: "Delete Event"
                   });
                   $('#buttonwrap_'+event.id).find('button:first').click(function() {
                     $('#dialog').dialog('destroy');
                     console.log(event);
                     updateEventDialog('/open_spaces/'+event.id+'/edit', $('#calendar'));
                     return false;
                   });
                 },
    eventResize: function (event, dayDelta, minuteDelta){
                 if (!event.end) {
                   event.end = event.start;
                 }
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
                  window.location.href = "/open_spaces/"+event.id
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
