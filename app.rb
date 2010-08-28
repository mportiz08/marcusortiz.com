require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require 'models/last_fm'

set :haml, { :format => :html5 }

get '/' do
  haml :index
end
