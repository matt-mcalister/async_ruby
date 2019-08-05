module Movie


    def self.get(search:nil,imdbID:nil, page:1)
        if search
            formatted_term = search.gsub(" ", "%20")
            req = HTTParty.get("http://www.omdbapi.com/?type=movie&s=#{formatted_term}&apikey=#{ENV['OMDB_API_KEY']}&page=#{page}")
            req.code == 200 ? req : {}
        elsif imdbID
            req = HTTParty.get("http://www.omdbapi.com/?type=movie&i=#{imdbID}&plot=short&apikey=#{ENV['OMDB_API_KEY']}")
            req.code == 200 ? req : {}
        end
    end


    def self.search(search)
        req = self.get(search: search)
        if req.parsed_response["Search"].length < 10
            results = req.parsed_response["Search"]
        else
            results = req.parsed_response["Search"]
            num_requests = req.parsed_response["totalResults"].to_i / 10
            (2..num_requests+1).each do |n|
                req = self.get(search: search, page: n)
                results.concat(req.parsed_response["Search"])
            end
        end
        results.map {|json| Item.new(json)}
    end

    def self.find_by_imdbID(imdbID)
        self.get(imdbID:imdbID)
    end

  class Item
    attr_reader :title, :year, :summary, :imdbID, :cover_image
    
    def initialize(movie_info)
        @title = movie_info["Title"]
        @year = movie_info["Year"]
        @imdbID = movie_info["imdbID"]
        @cover_image = movie_info["Poster"]
        assign_summary
    end

    def type
        :movie
    end

    def assign_summary
        full_info = Movie.find_by_imdbID(imdbID)
        @summary = full_info.parsed_response["Plot"]
    end


  end


end