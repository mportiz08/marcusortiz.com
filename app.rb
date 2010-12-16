require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sass'
require 'open-uri'

require 'helpers'
require 'models/last_fm'

set :run, false
set :environment, :production
set :views, File.dirname(__FILE__) + "/views"
set :public, File.dirname(__FILE__) + "/public"
set :haml, { :format => :html5 }

include Helpers

LAST_FM = LastFM::User.new("chipitople")
PROJECTS = ["techstori", "statusglob"]
PORTFOLIO = Helpers.get_snippet("portfolio.rb")

get '/' do
  @ie_hack = IEHack.get
  @song = LAST_FM.put_last_song
  @name = 'latest'
  @snippet = PORTFOLIO
  haml :index
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

get '/projects' do
  @song = LAST_FM.put_last_song
  @snippet = PORTFOLIO
  haml :projects
end

get '/projects/:name' do |name|
  @name = name
  raise Sinatra::NotFound if (@name != "latest") && !(PROJECTS.include? @name)
  @song = LAST_FM.put_last_song
  @snippet = PORTFOLIO
  haml "project_#{@name}".downcase.to_sym
end

def latest_project
  PROJECTS.last
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
