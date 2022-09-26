class MapQuestFacade

  def self.get_location(location)
    data = MapQuestService.get_location(location)
    Location.new(data)
  end
end
