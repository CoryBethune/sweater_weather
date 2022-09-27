class BreweriesSerializer
  def self.new_breweries(forecast, breweries, location)
    {
      data: {
        id: "null",
        type: "breweries",
        attributes: {
          destination: location,
          forecast: {
            summary: forecast.current[:weather].first[:description],
            temperature: forecast.current[:temp].to_s + " F"
          }
        }
      }
    }
  end
end
