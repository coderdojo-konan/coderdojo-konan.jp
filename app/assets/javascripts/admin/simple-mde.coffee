$(document).on 'turbolinks:load', ->
  simplemde = new SimpleMDE(
    element: $('#simpleMDE').get(0)
    spellChecker: false)
  return
