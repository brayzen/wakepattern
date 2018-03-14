class FeedbackMailer < ApplicationMailer
	default from: 'bray213@gmail.com'
	
	#default from: 'messenger@wakepattern.com'
	
	def send_notice_email(to_user, email_api_check_result)	
		if email_api_check_result
			@user = to_user
			mail( to: @user[:email], subject: "Someone left you feedback, and they want you to know.")
		else
			return email_api_check_result
		end
	end

end
