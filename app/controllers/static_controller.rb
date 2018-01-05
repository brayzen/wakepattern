class StaticController < ApplicationController
  def home
  	@feedback = Feedback.new
  end

	def homepage
	end

	def about
	end
	
	def mission
	end
end
