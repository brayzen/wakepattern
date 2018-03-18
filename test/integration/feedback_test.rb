require 'test_helper'

class FeedbackPagesTest < Capybara::Rails::TestCase
  before :each do
    @message = "Test Message"
  end

  test 'New Feedback' do
    receiver = create :receiver
    visit "/feedbacks/new/#{receiver.handle}"
    assert page.has_text? 'Leave your feedback to:'
    assert page.has_text? receiver.name
  end

  test 'Create Feedback' do
    sender = create :sender
    receiver = create :receiver
    login_as sender
    visit "/feedbacks/new/#{receiver.handle}"
    fill_in 'feedback_message', with: @message
    click_on 'Let them know how you feel'
    assert_equal Feedback.last.message, @message
  end
end
