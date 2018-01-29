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
		FeedbackMailer.notice_email(@user).deliver_now
		render 'feedback_mailer/notice_email'
	end

	def about
	end

	def mission
	end
end
