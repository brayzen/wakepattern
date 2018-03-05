class FeedbackMailer < ApplicationMailer
	require 'http'
  helper :email_api	
	#default from: 'messenger@wakepattern.com'
	default from: 'bray213@gmail.com'
	
	def notice_email(to_user)
		email_api.verify_email 'brian.ray.biz@gmail.com'
		@user = to_user
		mail( to: @user[:email], subject: "Someone left you feedback, and they want you to know.")
	end

end
