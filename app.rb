require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require 'models/last_fm'

set :haml, { :format => :html5 }

get '/' do
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end
