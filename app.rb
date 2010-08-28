require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require 'models/last_fm'

set :haml, { :format => :html5 }

get '/' do
  @song = LastFM::User.new("chipitople").put_last_song
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end
