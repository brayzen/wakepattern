class FeedbackMailer < ApplicationMailer
	default from: 'bray213@gmail.com'
	
	#default from: 'messenger@wakepattern.com'
	
	def notice_email(to_user)
		@user = to_user
		mail( to: @user[:email], subject: "Someone left you feedback, and they want you to know.")
	end

end
