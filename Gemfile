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
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'bcrypt'
gem 'domp'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'nokogiri'
gem 'dotenv-rails'
gem 'aws-sdk'

group :development, :test do
  gem 'pry-byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
	gem 'capistrano',         require: false
	gem 'capistrano-rvm',     require: false
	gem 'capistrano-rails',   require: false
	gem 'capistrano-bundler', require: false
	gem 'capistrano3-puma',   require: false
  gem 'faker'
end


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

