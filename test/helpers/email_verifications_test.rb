require 'test_helper'
require_relative '../../app/mailers/feedback_mailer'

class EmailVerificationTest < ActiveSupport::TestCase
	test "Email verification API call" do
		assert true
		response = get_api_data_about "brian.ray.biz@gmail.com"
		assert(response)
	end
end
