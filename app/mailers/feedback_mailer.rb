class FeedbackMailer < ApplicationMailer
	require 'http'
	
	#default from: 'messenger@wakepattern.com'
	default from: 'bray213@gmail.com'
	
	def notice_email(to_user)
		self.verify_email 'brian.ray.biz@gmail.com'
		@user = to_user
		mail( to: @user[:email], subject: "Someone left you feedback, and they want you to know.")
	end

	def verify_email email_address
		response = JSON.parse HTTP.get("https://emailverification.whoisxmlapi.com/api/v1?apiKey=at_u42n4EDEfC7Hotu9LZr4xZn3fdblK&emailAddress=" + email_address).body
		puts response
		response.each do |k, v| 
			if v == false 
				puts "#{k} equals #{v}" 
			end	
		end
	end
end
