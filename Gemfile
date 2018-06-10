source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'jquery-rails', '~> 4.3.1'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails', '~> 3.1.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.4.0'
gem 'bcrypt'
gem 'domp'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'nokogiri'
gem 'dotenv-rails'
gem 'aws-sdk-ses'
gem 'pg', '~> 0.18'
gem 'fuzzily'
gem 'http'
gem 'vuejs-rails'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
  gem 'faker'
  gem 'launchy'
  gem 'teaspoon-jasmine'
  gem 'phantomjs'
end


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

