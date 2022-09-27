require "rails_helper"

RSpec.describe "Breweries Facade" do
  it "returns a Breweries poro after receiving service call data" do
    poro = BreweriesFacade.get_breweries("denver", 3)

    expect(poro).to be_an(Breweries)
  end
end
