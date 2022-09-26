class OpenWeatherService
  def self.get_weather(lat, lon)
    response = connection.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}")
    parse_data(response)
  end

  private
    def self.connection
      Faraday.new(url: "https://api.openweathermap.org") do |faraday|
        faraday.params["appid"] = ENV['open_weather_api_key']
      end
    end

    def self.parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
