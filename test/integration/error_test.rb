require 'test_helper'

class ErrorPagesTest < Capybara::Rails::TestCase
  test '404' do
    visit '/404'
    assert page.has_text? 'Page not found'
  end

  test '' do
    visit '/500'
    assert page.has_text? "We're sorry, we are having technical difficulties"
  end
end
