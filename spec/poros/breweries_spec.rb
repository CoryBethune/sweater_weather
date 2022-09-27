require "rails_helper"

RSpec.describe "Breweries Poro" do
  it "creates an instance of Breweries" do
    breweries = BreweriesFacade.get_breweries("denver", 3)

    expect(breweries.all).to be_an(Array)
    expect(breweries.all.count).to eq(3)
    expect(breweries.all.first).to be_an(Hash)
    expect(breweries.all.first).to have_key(:id)
    expect(breweries.all.first).to have_key(:name)
    expect(breweries.all.first).to have_key(:brewery_type)
  end
end
