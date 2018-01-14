class FeedbackMailer < ApplicationMailer
	#default from: 'messenger@wakepattern.com'
	default from: 'bray213@gmail.com'
	
	def notice_email(to_user, expiration_code)
		@user = to_user
		expiration_code ||= 'ABCDEF'
		@home_url = 'localhost:3000/' 
		@mission_url = 'localhost:3000/about' 
		@wrong_name = 'www.espn.com' 
		@verify_url = "https://wakepattern.com/sign_up/" + expiration_code
		mail( to: @user[:email], subject: "Someone left you feedback, and they want you to know.")
	end
end
