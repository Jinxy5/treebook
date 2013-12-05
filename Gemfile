source 'https://rubygems.org'

group :development do
	gem 'capistrano'
	gem 'rb-fsevent'
	gem 'debugger'
end

group :development, :test do
	gem 'sqlite3'
	gem 'guard-rspec'
	gem 'guard-livereload', require: false
	gem 'guard-shell'
	gem 'webrick', '~> 1.3.1'
end

group :test do
	gem 'rspec-rails'
	gem 'shoulda-matchers'
	gem 'factory_girl_rails'
	gem 'capybara', '~> 2.2.0'
	gem 'selenium-webdriver'
=begin 	
	capybara-webkit requires an application called 'libqtwebkit-dev' to compile. 
	All headless servers need an external program to install, and capybara-webkit is the easiet.
	To install 'libqtwebkit-dev' on Ubuntu, run
    
  	sudo apt-get install libqtwebkit-dev
=end
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
gem 'awesome_print'


# tests
gem 'selenium-webdriver'


