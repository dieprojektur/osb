$(document).ready(function() {
  $('#tabs').tabs(); 
  $('#trackmenu button:first').button({
    icons: {primary: "ui-icon-plus"},
    text: 'Add Track'
  }).click(function() {
    url = $(this).attr('data-url-newtrack');
    alert(url);
    var form = $('#dialog').dialog({
      title: 'Add Event', 
      modal: true
    }).load(url, function() {
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
          complete(function (xhr, status) {
            
          });
        $(this).dialog('close');
        $(this).dialog('destroy');
        };
        buttons['Cancel'] = function() {
          $(this).dialog('close');
          $(this).dialog('destroy');
        }
        $(this).dialog('option', 'buttons', buttons);
    });
  });

  return false;
  var track5 = $('#track5').fullCalendar({defaultView: 'agendaDay', height: 300});
});
