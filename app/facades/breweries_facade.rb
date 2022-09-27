class BreweriesFacade

  def self.get_breweries(city, quantity)
    data = BreweriesService.get_breweries(city, quantity)
    
    Breweries.new(data)
  end
end
