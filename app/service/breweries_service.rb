class BreweriesService

  def self.get_breweries(location, quantity)
    response = connection.get("/breweries?by_city=#{location}&per_page=#{quantity}")
    parse_data(response)
  end

  private
    def self.connection
      Faraday.new(url: "https://api.openbrewerydb.org")
    end

    def self.parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
