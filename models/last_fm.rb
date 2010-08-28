require 'json'
require 'open-uri'

module LastFM
  API_URL  = "http://ws.audioscrobbler.com/2.0/"
  API_KEY  = YAML::load(File.open(File.join(File.dirname(__FILE__), '..', 'config', 'app.yml')))["last_fm"]["api_key"]
  API_ARGS = "&format=json&api_key=#{API_KEY}"
  
  class User
    def initialize(username)
      @username = username
    end
    
    def last_song
      request = "#{API_URL}?method=user.getrecenttracks&user=#{@username}&limit=1#{API_ARGS}"
      response = JSON.parse(open(request).read)["recenttracks"]["track"]
      response.kind_of?(Array) ? response.first : response
    end
    
    def now_playing?(song_hash)
      song_hash.has_key?("@attr") ? true : false
    end
    
    def put_last_song
      song = last_song
      toggle = "off"
      status = "was listening to "
      toggle = "on" if now_playing?(song)
      status = "listening to " if now_playing?(song)
      "<img src=\"/images/speaker_#{toggle}.png\" /><h4>#{status}<strong>#{song["name"]}</strong> by <strong>#{song["artist"]["#text"]}</strong></h4>"
    end
  end
end
