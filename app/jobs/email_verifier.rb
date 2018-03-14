
require "http"

class EmailVerifier 
	
	def self.validate email_address
		response = self.call email_address.to_s
		self.pass? response
	end


private

	def self.call email_address
		JSON.parse HTTP.get("https://emailverification.whoisxmlapi.com/api/v1?apiKey=#{ENV["EMAIL_VERIFICATION_API_KEY"]}&emailAddress=#{email_address}").body 
	end

	def self.pass? response
		return response["ErrorMessage"] if response["ErrorMessage"]
		true
	end
end

