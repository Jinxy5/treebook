source 'https://rubygems.org'

group :development do
	gem 'capistrano'
	gem 'guard-rspec'
	gem 'guard-livereload', require: false
	gem 'rb-fsevent'
	gem 'debugger'
end

group :development, :test do
	gem 'rspec-rails', '~> 2.14.0'
	gem 'sqlite3'
end

group :test do
	gem 'factory_girl_rails'
	gem 'capybara', '~> 2.2.0'
	gem 'selenium-webdriver'
	# uses a program called 'libqtwebkit-dev' to build. To install 'libqtwebkit-dev' in Ubuntu, run
	# sudo apt-get install libqtwebkit-dev

#	gem 'capybara-webkit'

	gem 'rb-readline'
	gem 'launchy'
	gem 'database_cleaner'
end

group :production do
	gem 'pg'
end

# standard library
gem 'rails', '4.0.1'
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
gem 'devise'
gem 'puma'

