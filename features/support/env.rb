ENV['RACK_ENV'] ||= 'test'

require File.dirname(__FILE__) + '/../../config/environment'
require 'rack/test'
require 'rspec'
require 'capybara/cucumber'
require 'faker'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'launchy'


Capybara.app = SlowFoodApp

DatabaseCleaner.strategy = :transaction

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end
