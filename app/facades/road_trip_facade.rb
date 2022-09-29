class RoadTripFacade
  def self.get_road_trip(origin, destination)
    trip_data = MapQuestService.get_road_trip(origin, destination)
    RoadTrip.get_road_trip(trip_data)

    # weather = OpenWeatherFacade.get_weather(trip_data)
  end
end
