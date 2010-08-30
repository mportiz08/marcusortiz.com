require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'open-uri'

require 'models/last_fm'

set :haml, { :format => :html5 }

get '/' do
  @ie_hack = IEHack.get
  @song = LastFM::User.new("chipitople").put_last_song
  @snippet = get_snippet
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

def get_snippet
  open("snippet.rb").read
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
