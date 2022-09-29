require "rails_helper"

RSpec.describe "Road Trip Facade" do
  it "creates a RoadTrip poro" do
    RoadTripFacade.get_road_trip("Denver, CO", "Dallas, TX")
  end
end
