source 'https://rubygems.org'

ruby '2.4.1'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'sinatra-redirect-with-flash'

gem 'activerecord'
gem 'activesupport'
gem 'bcrypt'

gem 'rake'
gem 'shotgun'
gem 'faker'
gem 'dotenv'
gem 'sendgrid-ruby'


group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
  gem 'cucumber', '~> 2.4'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'email_spec', require: 'email_spec'
end

group :test, :development do
  gem 'factory_bot'
  gem 'pry-byebug'
  gem 'timecop'
end
