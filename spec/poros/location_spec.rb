require "rails_helper"

RSpec.describe "Location Poro" do
  it "creates an instance of location" do
    location = MapQuestFacade.get_location("denver,co")

    expect(location.lat).to eq(39.738453)
    expect(location.lon).to eq(-104.984853)
  end
end
