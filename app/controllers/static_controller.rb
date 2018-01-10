class StaticController < ApplicationController
  def home
  	@feedback = Feedback.new
  end

	def mail_it 
		@user = {
			first_name: 'Brian',
			last_name: 'Ray',
			email: 'brian.ray.biz@gmail.com'
		}
		@expiration_code = 'EDCBA'
		FeedbackMailer.notice_email(@user, @expiration_code).deliver_now
		redirect_to '/' 
	end

	def about
	end
	
	def mission
	end
end
