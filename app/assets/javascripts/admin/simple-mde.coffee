$(document).on 'turbolinks:load', ->
  simplemde = new SimpleMDE(
    element: $('#simpleMDE')[0]
    spellChecker: false)
  return
