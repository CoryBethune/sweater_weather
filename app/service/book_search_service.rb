class BookSearchService
  def self.get_books(subject)
    response = connection.get("/search.json?subject=#{subject}")
  end

  private
    def self.connection
      Faraday.new(url: "http://openlibrary.org")
    end

    def self.parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
