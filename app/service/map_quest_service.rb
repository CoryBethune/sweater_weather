class MapQuestService

  def self.get_location(location)
    response = connection.get("/geocoding/v1/address?location=#{location}")
    parse_data(response)
  end

  private
    def connection
      Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
        faraday.params["key"] = ENV['map_quest_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
