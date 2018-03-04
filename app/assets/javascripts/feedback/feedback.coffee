class @Feedback
  constructor: ->
    @receiver = new Receiver 'input.receiver', '.feedback_form'

$ ->
  new Feedback()
