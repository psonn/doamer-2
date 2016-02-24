source 'https://rubygems.org'
ruby "2.2.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'devise'
gem 'paperclip', :git=> 'https://github.com/thoughtbot/paperclip'
gem 'aws-sdk', '~> 2'
gem 'masonry-rails', '~> 0.2.0'
gem 'will_paginate', '~> 3.0.5'
gem 'will_paginate-bootstrap'
# gem 'pace-rails', git: 'git@github.com:yovu/pace-rails.git'

gem 'acts_as_votable', '~> 0.10.0'
gem 'public_activity'
gem 'friendly_id', '~> 5.1.0'
gem 'data-confirm-modal', github: 'ifad/data-confirm-modal' 
gem 'mail_form'
gem 'font-awesome-sass'
gem 'country_select'
gem 'carrierwave'
gem "rmagick"
gem "fog"
gem 'carrierwave_direct'
gem 'sidekiq'
gem 'wicked'
gem 'local_time'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'foreman'
  gem 'dotenv-rails'

  gem 'thin'
end

group :production do
     gem 'pg'
     gem 'rails_12factor'
end