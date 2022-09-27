require "rails_helper"

RSpec.describe "Breweries Service" do
  it "gets a list of breweries by city" do
    data = BreweriesService.get_breweries("denver", 3)

    expect(data).to be_an(Array)
    expect(data.first).to be_an(Hash)
    expect(data.first).to have_key(:city)
    expect(data.first).to have_key(:name)
    expect(data.first).to have_key(:brewery_type)
  end
end
