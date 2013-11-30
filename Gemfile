source 'https://rubygems.org'

group :development do
	gem 'capistrano'
	gem 'rb-fsevent'
	gem 'debugger'
end

group :development, :test do
	gem 'rspec-rails', '~> 2.14.0'
	gem 'sqlite3'
	gem 'guard-rspec'
	gem 'guard-livereload', require: false
	gem 'guard-shell'
	gem 'webrick', '~> 1.3.1'
end

group :test do
	gem 'factory_girl_rails'
	gem 'capybara', '~> 2.2.0'
	gem 'selenium-webdriver'
# 	capybara-webkit gem requires an application called 'libqtwebkit-dev' to build. To install 'libqtwebkit-dev' in Ubuntu, run
# 	sudo apt-get install libqtwebkit-dev
#	gem 'capybara-webkit'
	gem 'rb-readline'
	gem 'launchy'
	gem 'database_cleaner'
end

group :production do
	gem 'pg'
#	gem 'puma'
end

# rails version
gem 'rails', '4.0.1'

# standard library
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'


group :doc do
  gem 'sdoc', require: false
end

# custom 
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'simple_form'


