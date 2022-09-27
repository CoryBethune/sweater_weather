class OpenWeatherFacade
  def self.get_weather(lat, lon)
    data = OpenWeatherService.get_weather(lat, lon)
    Forecast.new(data)
  end
end
