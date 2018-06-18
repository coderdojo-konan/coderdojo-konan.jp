# FacebookSDK
# https://developers.facebook.com/docs/plugins/page-plugin/
((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8'
  fjs.parentNode.insertBefore js, fjs
  return
) document, 'script', 'facebook-jssdk'
# Replace 'facebook-jssdk' with your page id.
# Compatibility with Turbolinks 5
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