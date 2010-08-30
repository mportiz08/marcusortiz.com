require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'open-uri'

require 'models/last_fm'

set :haml, { :format => :html5 }

LAST_FM = LastFM::User.new("chipitople")
PROJECTS = ["statusglob"]

get '/' do
  @ie_hack = IEHack.get
  @song = LAST_FM.put_last_song
  @snippet = get_snippet("index.rb")
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

get '/project/:name' do |name|
  @name = name
  raise Sinatra::NotFound if (@name != "latest") && !(PROJECTS.include? @name)
  @song = LAST_FM.put_last_song
  @snippet = get_snippet("#{@name}.rb")
  
  if name.eql? "latest"
    @name = latest_project
    @snippet = get_snippet("#{@name}.rb")
    haml "project_#{@name}".downcase.to_sym
  else
    haml "project_#{@name}".downcase.to_sym
  end
end

def latest_project
  PROJECTS.last
end

def get_snippet(filename)
  path = "public/snippets/#{filename}"
  File.exists?(path) ? open("public/snippets/#{filename}").read : ""
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
