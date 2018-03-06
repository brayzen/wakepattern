require 'test_helper'
require 'email_verifier'
EV = EmailVerifier

class EmailVerificationTest < ActiveSupport::TestCase
	email_pass = "brian.ray.biz@gmail.com"
	response = EV.call email_pass 
	
	test "Email verification API call" do
		assert response
	end

	test "API EmailVerifier.interpet is" do
		assert_nil(EV.interpret response)
	end
	
	test "API response.validate is" do
		assert_nil(EV.validate email_pass)
	end



  # 
  # Now with a bad format 
  # 
	email_fail = "b<@gs*com"
	email_fail_2 = "tests@examplecom"
	response_2 = EV.call email_fail 
	response_3 = EV.call email_fail_2 
  error_message = {"ErrorMessage"=>[{"Error"=>"The email address must be a valid email address."}]}	
	
	test "2nd test with failing email address, Email verification API call" do
		refute_empty response_2
	end
	
	test "API call for bad format" do
		assert_equal(response_2.to_s, error_message.to_s) 
	end


	test "API EmailVerifier.interpet fails and prints message for bad format" do
		interpreted = EV.interpret(response_3)
		assert_equal(interpreted, error_message["ErrorMessage"][0]["Error"])
	end

  
	test "3nd test with failing email address, Email verification API call" do
		refute_empty response_3
	end

	test "API call for bad Domain" do
		assert_equal(response_3.to_s, error_message.to_s) 
	end

	test "API EmailVerifier.interpet fails and prints message for bad DNS format" do
		interpreted = EV.interpret(response_3)
		assert_equal(interpreted, error_message["ErrorMessage"][0]["Error"])
	end
end
