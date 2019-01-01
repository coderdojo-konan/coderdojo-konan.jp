init_datetimepciker = ->
  (->
    $(".form_datetime").datetimepicker
      locale: "ja"
      format: "YYYY/MM/DD HH:mm"
  )

$(document).ready ->
  init_datetimepciker()

$(document).on "ready turbolinks:load", init_datetimepciker()

$.fn.datetimepicker.Constructor.Default = $.extend({}, $.fn.datetimepicker.Constructor.Default, {
            icons: {
                time: 'far fa-clock',
                date: 'far fa-calendar',
                up: 'fas fa-arrow-up',
                down: 'fas fa-arrow-down',
                previous: 'fas fa-chevron-left',
                next: 'fas fa-chevron-right',
                today: 'far fa-calendar-check-o',
                clear: 'far fa-trash',
                close: 'far fa-times'
            } });
