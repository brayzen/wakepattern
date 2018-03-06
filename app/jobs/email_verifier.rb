
require "http"

class EmailVerifier 
	
	def self.validate email_address
		response = self.call email_address.to_s
		self.interpret response
	end

private

	def self.call email_address
		JSON.parse HTTP.get("https://emailverification.whoisxmlapi.com/api/v1?apiKey=#{ENV["EMAIL_VERIFICATION_API_KEY"]}&emailAddress=#{email_address}").body 
	end

	def self.interpret response
		response.each do |k, v|
			if response["ErrorMessage"]
				response["ErrorMessage"].each {|err| return err["Error"]}
			end
		end
		nil	
	end
end

