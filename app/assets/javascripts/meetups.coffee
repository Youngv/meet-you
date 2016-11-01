# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  options = {
    format: 'YYYY-MM-DD HH:mm'
    locale: 'zh-cn'
    minDate: moment()
  }
  if $('#meetup_date').val()
    options["defaultDate"] = moment($('#meetup_date').val(), "YYYY-MM-DD HH:mm");
  $('#meetup_date').datetimepicker options
