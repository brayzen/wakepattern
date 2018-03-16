# require 'test_helper'
# require 'email_verifier'
# EV = EmailVerifier

# class EmailVerificationTest < ActiveSupport::TestCase
# 	email_pass = "brian.ray.biz@gmail.com"
# 	response = EV.call email_pass

# 	test "Email verification API call" do
# 		assert response
# 	end

# 	test "API EmailVerifier.interpet is" do
# 		assert_equal(EV.pass?(response), true)
# 	end

# 	test "API response.validate is" do
# 		assert_equal(EV.validate(email_pass), true)
# 	end



#   #
#   # Now with a bad format
#   #
# 	email_fail = "b<@gs*com"
# 	email_fail_2 = "tests@examplecom"
# 	response_2 = EV.call email_fail
# 	response_3 = EV.call email_fail_2
#   error_message = {"ErrorMessage"=>[{"Error"=>"The email address must be a valid email address."}]}

# 	test "2nd test with failing email address, Email verification API call" do
# 		refute_empty response_2
# 	end

# 	test "API call for bad format" do
# 		assert_equal(response_2.to_s, error_message.to_s)
# 	end

# 	test "API EmailVerifier.pass? fails and prints message for bad format" do
# 		failed = EV.pass?(response_3)
# 		assert_equal(failed, error_message["ErrorMessage"])
# 	end

# 	test "API call for bad Domain" do
# 		assert_equal(response_3.class, Hash)
# 		assert_equal(response_3, error_message)
# 	end

# 	test "API EmailVerifier.interpet fails and prints message for bad DNS format" do
# 		failed = EV.pass?(response_3)
# 		assert_equal(failed.class, Array)
# 		assert_equal(failed, error_message["ErrorMessage"])
# 	end
# end
