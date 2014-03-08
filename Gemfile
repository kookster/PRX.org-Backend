source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0'

## Model
# Use mysql as the database for Active Record
gem 'mysql2'

# ActiveRecord model additions
gem 'acts_as_paranoid', github: 'byroot/rails3_acts_as_paranoid', branch: 'rails4.0'
gem 'acts_as_list'
gem 'event_attribute'

# file uploads
gem 'carrierwave'
gem 'fog'
gem 'unf'

## Controller
# auth
gem 'rack-cors', :require => 'rack/cors'

# paging
gem 'kaminari'


## View
# json handling
gem 'roar-rails'
gem 'rails-patch-json-encode'
gem 'oj'


## Deployment
# configuration
gem 'dotenv-rails'

# scripting
gem 'capistrano', '~> 3.1'
gem 'capistrano-rails', '~> 1.1'
gem 'highline'
gem 'rake'

# monitoring
gem 'newrelic_rpm'


# These will not be installed on travis - keep all
# developer-specific gems here so our travis builds
# stay snappy!
group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'

  gem 'growl', require: false
  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-bundler'
  gem 'spring'
end

group :development, :test do
  gem 'minitest-rails'
  gem 'minitest-reporters', require: false
  gem 'factory_girl_rails'
  gem "codeclimate-test-reporter", require: false
  gem 'simplecov' #, '~> 0.7.1'
  gem 'coveralls', require: false
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
