class WorldDataController < ApplicationController
  def statistics
    @trait_averages = FeedbackTrait.averages FeedbackTrait.all, decimal_place: 5
  end
end
