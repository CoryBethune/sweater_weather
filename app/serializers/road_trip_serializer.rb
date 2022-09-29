class RoadTripSerializer
  def self.new_trip(trip_data, forecast, origin, destination)
    {
      data: {
        id: "null",
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: trip_data.time,
          weather_at_eta: {
            temperature: forecast.hourly[(trip_data.time.byteslice(0, 2).to_i)][:temp],
            conditions: forecast.hourly[(trip_data.time.byteslice(0, 2).to_i)][:weather][0][:description]
          }
        }
      }
    }
  end

end
