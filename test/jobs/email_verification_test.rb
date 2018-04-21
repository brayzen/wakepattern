require 'test_helper'
require 'email_verifier'
EV = EmailVerifier

class EmailVerificationTest < ActiveSupport::TestCase
	good_email = "brian.ray.biz@gmail.com"
	response = EV.call good_email

  test "Email verification API call" do
    assert response
  end

  test "API EmailVerifier.pass is" do
    assert_equal(EV.pass?(response), true)
  end

  test "API response.validate is working with good_email" do
    assert_equal(EV.validate(good_email), true)
  end

	bad_email = "b<@gs*com"
	bad_email_2 = "tests@examplecom"
	response_2 = EV.call bad_email
	response_3 = EV.call bad_email_2
	error_message = {"ErrorMessage"=>[{"Error"=>"The email address must be a valid email address."}]}

  test "2nd test with failing email address, Email verification API call" do
    refute_empty response_2
  end

  test "API call for bad format" do
    assert_equal(response_2.to_s, error_message.to_s)
  end

  test "API EmailVerifier.pass? fails and prints message for bad format" do
    failed = EV.pass?(response_3)
    assert_equal(failed, error_message["ErrorMessage"])
  end

  test "API call for bad Domain" do
    assert_equal(response_3.class, Hash)
    assert_equal(response_3, error_message)
  end

  test "API EmailVerifier.interpet fails and prints message for bad DNS format" do
    failed = EV.pass?(response_3)
    assert_equal(failed.class, Array)
    assert_equal(failed, error_message["ErrorMessage"])
  end
end
