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
		@expiration_code = SecureRandom.hex(10) 
	# 
	# testing purposes
	#
		@home_url = '/' 
		@mission_url = '/about' 
		@wrong_name = 'http://www.espn.com' 
		@verify_url = "https://wakepattern.com/sign_up/" + @expiration_code
		FeedbackMailer.notice_email(@user, @expiration_code).deliver_now
		render 'layouts/mailer_notice' 
	end

	def about
	end
	
	def mission
	end
end
