require 'test_helper'

class ErrorPagesTest < Capybara::Rails::TestCase
  test 'Page not found' do
    visit '/404'
    assert page.has_text? 'Page not found'
  end

  test 'internal server error' do
    visit '/500'
    assert page.has_text? "We're sorry, we are having technical difficulties"
  end
end
