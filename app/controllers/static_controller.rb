class StaticController < ApplicationController
  def home
  	@feedback = Feedback.new
		@traits = Trait.all.select { |t| t.order }
  end

	def homepage
	end
end
