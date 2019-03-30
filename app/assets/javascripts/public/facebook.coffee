window.fbAsyncInit = ->
  FB.init
    appId: '560981844422844'
    xfbml: true
    version: 'v3.2'
  FB.AppEvents.logPageView()
  return

((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = 'https://connect.facebook.net/en_US/sdk.js'
  fjs.parentNode.insertBefore js, fjs
  return
) document, 'script', 'facebook-jssdk'


(($) ->
  fbRoot = undefined

  saveFacebookRoot = ->
    if $('#fb-root').length
      fbRoot = $('#fb-root').detach()
    return

  restoreFacebookRoot = ->
    if fbRoot != null
      if $('#fb-root').length
        $('#fb-root').replaceWith fbRoot
      else
        $('body').append fbRoot
    if typeof FB != 'undefined' and FB != null
      # Instance of FacebookSDK
      FB.XFBML.parse()
    return

  document.addEventListener 'turbolinks:request-start', saveFacebookRoot
  document.addEventListener 'turbolinks:load', restoreFacebookRoot
  return
) jQuery
