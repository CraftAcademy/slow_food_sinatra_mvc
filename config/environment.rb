ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'
require 'dotenv/load'
require 'uri'
require 'pathname'
require 'pg'
require 'active_record'
require 'logger'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'sinatra/reloader' if development?
require 'pry' unless production?
require 'sendgrid-ruby'
require 'erb'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = 'slow_food'

require APP_ROOT.join('config', 'database')


class SlowFoodApp < Sinatra::Base
  disable :logger, :dump_errors
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::RedirectWithFlash
  include SendGrid
  set :session_secret, ENV['SESSION_SECRET'] || '1234ewqweert452233'
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'public')
  set :show_exceptions, false
end


Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each {|file| require file}
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each {|file| require file}

