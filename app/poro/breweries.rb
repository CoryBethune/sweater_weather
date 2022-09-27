class Breweries
  attr_reader :all

  def initialize(data)
    @all = data.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type]
      }
    end
  end
end
