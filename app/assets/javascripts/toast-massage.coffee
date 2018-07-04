$(document).on 'turbolinks:load', ->
  if $.trim($('#info > .notice').html())!=''
    toastr.success $('#info > .notice').text()
    console.log 'Show Notice:' + $('#info > .notice').text()
  else if $.trim($('#info > .alert').html())!=''
    toastr.error $('#info > .alert').text()
    console.log 'Show Alert:' + $('#info > .alert').text()
  else
    console.log 'No Words'
