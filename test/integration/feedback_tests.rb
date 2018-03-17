require 'test_helper'

class ErrorPagesTest < Capybara::Rails::TestCase
  test 'Feedback by handle' do
    user = create_user :user
    visit "feedbacks/new/#{user.handle}"
    assert page.has_text? 'Leave Your Feedback To:'
    assert page.has_text? user.name
  end
end
