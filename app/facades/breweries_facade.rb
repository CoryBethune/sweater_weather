class BreweriesFacade

  def self.get_breweries(city, quantity)
    data = BreweriesService.get_location(location)
    Breweries.new(data)
  end
end
