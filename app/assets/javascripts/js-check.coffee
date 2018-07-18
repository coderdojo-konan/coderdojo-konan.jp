$ ->
  console.log('No Events')
  $(document).on 'turbolinks:load', callTurbolinks_load_event

callTurbolinks_load_event = ->
  console.log('turbolinks:load called!')
  return
