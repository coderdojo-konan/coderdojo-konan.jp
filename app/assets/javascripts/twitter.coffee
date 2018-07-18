
twttr_events_bound = false

$ ->
  loadTwitterSDK ->
    bindTwitterEventHandlers() unless twttr_events_bound

bindTwitterEventHandlers = ->
  $(document).on 'turbolinks:load', renderTweetButtons
  twttr_events_bound = true

renderTweetButtons = ->
  $('.twitter-share-button').each ->
    button = $(this)
    button.attr('data-url', document.location.href) unless button.data('url')?
    button.attr('data-text', document.title) unless button.data('text')?
  twttr.widgets.load()

loadTwitterSDK = (callback) ->
  $.getScript('//platform.twitter.com/widgets.js', callback)


document.addEventListener 'turbolinks:load', ->
  !((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    p = if /^http:/.test(d.location) then 'http' else 'https'
    if !d.getElementById(id)
      js = d.createElement(s)
      js.id = id
      js.src = p + '://platform.twitter.com/widgets.js'
      fjs.parentNode.insertBefore js, fjs
    return
  )(document, 'script', 'twitter-wjs')
  return
