require File.dirname(__FILE__) + '/../../config/environment'

require 'rack/test'
require 'rspec'
require 'capybara/cucumber'
require 'faker'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'launchy'

Capybara.app = SlowFoodApp

DatabaseCleaner.strategy = :truncation

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end

World do
  SlowFoodApp.new
end

class SlowFoodWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end