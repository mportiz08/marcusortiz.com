#require 'rubygems'
#require 'vendor/sinatra/lib/sinatra.rb'

require 'rubygems'
require 'bundler'

Bundler.require

require 'app'
run Sinatra::Application
