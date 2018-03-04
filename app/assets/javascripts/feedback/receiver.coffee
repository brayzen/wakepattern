class @Receiver
  constructor: (selector, parent='body')->
    @elem = $(parent).find selector
    @text_handler()

  text_handler: ->
    @elem.on 'change, paste, keyup', (e)->
      text = $(@).val()
      return unless text.length >= 3

      $.get "/users/fuzzysearch/#{text}", (data)->
        console.log data
