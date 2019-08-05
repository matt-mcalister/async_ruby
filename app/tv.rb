module Tv


    @@token = ""
    BASE_URL = "https://api.thetvdb.com"

     def self.token
        @@token
    end

    def self.options
        {
            headers: {
            'Content-Type' => 'application/json',
            'Authorization' => "Bearer #{self.token}"
            }
        }
    end

    def self.assign_token
        r = HTTParty.post(BASE_URL + "/login", {
        body: {
            apikey: ENV['TVDB_API_KEY'],
            userkey: ENV['TVDB_USER_KEY'],
            username: ENV['TVDB_USERNAME']
        }.to_json,
        headers: {
            'Content-Type' => 'application/json'
        }
        })
        if r.parsed_response["token"]
            @@token = r.parsed_response["token"]
        else
            @counter ||= 0
            if @counter < 5
            @counter += 1
            puts "trying again: #{@counter}"
            self.assign_token
            end
        end
    end

    def self.get(route)
        if self.token == ""
            self.assign_token
        end
        HTTParty.get(BASE_URL + route, self.options)
    end


   def self.search(term)
        req = self.get("/search/series?name=#{term.gsub(" ", "%20")}")
        if req.parsed_response["data"]
            req.parsed_response["data"].map {|json| Item.new(json)}
        else
            []
        end
    end

    def self.find_by_tvdbID(tvdbID)
        req = self.get("/series/#{tvdbID}")
        req.code == 200 ? req.parsed_response["data"] : {}
    end

    def self.find_cover_image_by_tvdbID(tvdbID)
        req = self.get("/series/#{tvdbID}/images/query?keyType=poster")
        if req.code == 200 && !req.parsed_response["data"].nil? && req.parsed_response["data"][0]['fileName'] != ""
            "https://www.thetvdb.com/banners/#{req.parsed_response['data'].last['fileName']}"
        else
            "http://www.reelviews.net/resources/img/default_poster.jpg"
        end
    end


  class Item
    attr_reader :title, :year, :summary, :tvdbID, :cover_image
    
    def initialize(series_info)
        @title = series_info["seriesName"]
        @year = series_info["firstAired"][0...4] === "" ? nil : series_info["firstAired"][0...4]
        @summary = series_info["overview"]
        @tvdbID = series_info["id"]
        assign_cover_image
     end

    def type
        :tv
    end

    def assign_cover_image
        @cover_image = Tv.find_cover_image_by_tvdbID(tvdbID)
    end


  end


end