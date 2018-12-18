$(document).on 'turbolinks:load', ->
  if $.trim($('#info > .notice').html())!=''
    toastr.success $('#info > .notice').text()
  else if $.trim($('#info > .alert').html())!=''
    toastr.error $('#info > .alert').text()
