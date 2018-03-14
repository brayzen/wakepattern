class StaticController < ApplicationController
  def home
  	@feedback = Feedback.new
  	header[:background] = header[:logo] = false
  end

  # testing
	def mail_it
		@user = {
			first_name: 'Brian',
			last_name: 'Ray',
			email: 'brian.ray.biz@gmail.com'
		}
		FeedbackMailer.send_notice_email(@user, EmailVerifier.validate(@user[:email])).deliver_now
		render 'feedback_mailer/send_notice_email'
	end

	def about
		render html: "<strong>Not Found</strong>".html_safe
	end

	def mission
	end
	
  def correct_email_land
	end

	def incorrect_email_land
	end
end
