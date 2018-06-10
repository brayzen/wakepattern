App.feedbacks = App.cable.subscriptions.create 'FeedbacksChannel',
  received: (data)->
    $(document).trigger 'feedbacks_received', data
