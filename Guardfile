group :livereload
  guard 'livereload' do
    watch(/^(?!(?:.*log$)|tmp|db|spec).*$/) 
  end
end

group :rspec
  guard :rspec do
    watch(/^(?!(?:.*log$)|tmp|db|Gemfile).*$/) {"spec"} 
  end
end

group :shell
  guard :shell do
    watch(/Gemfile/) { `bundle install` }
  #  watch(/db\/migrate/) { `bin/rake db:migrate RAILS_ENV=test` }
  #  watch(/db\/migrate/) { `bin/rake db:migrate RAILS_ENV=development` }
  end
end