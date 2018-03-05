require "http"

class EmailVerifier 
	
	def self.validate email_address
    response = self.call email_address
		self.interpret response
	end

private
	
	ERROR_HASH = {
		"formatCheck": {is_valid: "false", message: "The format of the email address is incorrect.  Please fix and send again."},
		"smtpCheck": {is_valid: "true", message: "This email address doesn't exist or is invalid."},
		"dnsCheck": {is_valid: "true", message: "The domain name doesn't exist or is invalid."}
		#"disposableCheck": {is_valid: "false", message: "Good chance this email isn't valid, and was created as a disposable email."},
		#"catchAllCheck": {is_valid: "false", message: "Good chance this email is a catchall email that is one amoung many that deliver to another inbox."}
	}

	def self.call email_address
		JSON.parse http.get("https://emailverification.whoisxmlapi.com/api/v1?apiKey=#{ENV["EMAIL_VERIFICATION_API_KEY"]}&emailAddress=#{email_address}").body 
	end

	def self.interpret response
		response.each do |k, v|
			 return ERROR_HASH[k][:message] unless ERROR_HASH[k]&[is_valid] == v 
		end
		true	
	end
end
