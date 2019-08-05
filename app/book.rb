
module Book


    def self.search(term)
        if term != ""
            formatted_term = term.gsub(" ", "%20")

            req = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{formatted_term}&maxResults=40")
            if !req.parsed_response["items"]
                []
            else
                req.parsed_response["items"].map {|json| Item.new(json["volumeInfo"])}
            end
        else
            []
        end
    end

  class Item
    attr_reader :title, :year, :summary, :cover_image
    
    def initialize(book_info)
        @title = book_info["title"]
        @year = book_info["publishedDate"] && book_info["publishedDate"][0...4]
        @summary = book_info["description"]
        @cover_image = book_info["imageLinks"]["thumbnail"]
    end

    def type
        :book
    end


  end


end
