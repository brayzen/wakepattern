class FeedbacksChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'feedbacks'
  end
end
