require "rails_helper"

RSpec.describe "Map Quest Facade" do
  it "returns a location poro after recieving service call data" do
    location = MapQuestFacade.get_location("denver")

    expect(location).to be_a(Location)
  end
end
