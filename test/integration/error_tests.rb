require 'test_helper'

class ErrorPagesTest < Capybara::Rails::TestCase
  test '404' do
    visit '/404'

    expect(page).to have_content 'page not found'
  end
end
