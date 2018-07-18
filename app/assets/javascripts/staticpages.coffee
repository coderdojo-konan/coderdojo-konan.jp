# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# ((d, s, id) ->
#   js = undefined
#   fjs = d.getElementsByTagName(s)[0]
#   if d.getElementById(id)
#     return
#   js = d.createElement(s)
#   js.id = id
#   js.src = 'https://connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.12&appId=1974108302904511&autoLogAppEvents=1'
#   fjs.parentNode.insertBefore js, fjs
#   return
# ) document, 'script', 'facebook-jssdk'

# document.addEventListener 'mdl-componentupgraded', ->
#   # Twitter Widget
#   !((d, s, id) ->
#     js = undefined
#     fjs = d.getElementsByTagName(s)[0]
#     p = if /^http:/.test(d.location) then 'http' else 'https'
#     if !d.getElementById(id)
#       js = d.createElement(s)
#       js.id = id
#       js.src = p + '://platform.twitter.com/widgets.js'
#       fjs.parentNode.insertBefore js, fjs
#     return
#   )(document, 'script', 'twitter-wjs')
#   return
