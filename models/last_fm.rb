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
  end
end
