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
          weather_at_eat: {
            # temperature:
            # conditions:
          }
        }
      }
    }
  end

end
