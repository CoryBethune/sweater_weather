class RoadTripFacade
  def self.get_road_trip(origin, destination)
    map_data = MapQuestService.get_road_trip(origin, destination)
    RoadTrip.new(map_data)
  end
end
