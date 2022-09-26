class MapQuestService

  def self.get_location(location)
    response = connection.get("/geocoding/v1/address?location=#{location}")
    parse_data(response)
  end

  private
    def self.connection
      Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
        faraday.params["key"] = ENV['map_quest_api_key']
      end
    end

    def self.parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
