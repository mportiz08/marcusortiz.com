require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require 'models/last_fm'

set :haml, { :format => :html5 }

get '/' do
  @ie_hack = IEHack.get
  @song = LastFM::User.new("chipitople").put_last_song
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

module IEHack
  def self.get
    "<!--[if IE]>
       <style type=\"text/css\">
         #header {
           background:#000000;
           filter:alpha(opacity=50)
           zoom: 1;
         } 
       </style>
     <![endif]-->"
  end
end
