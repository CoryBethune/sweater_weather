class RoadTripFacade
  def self.get_road_trip(origin, destination)
    map_data = MapQuestService.get_road_trip(origin, destination)
    RoadTrip.new_road_trip(map_data)
  end
end
