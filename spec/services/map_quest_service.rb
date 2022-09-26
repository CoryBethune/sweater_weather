require "rails_helper"

RSpec.describe "Map Quest Service" do
  it 'gets the lat and long of a location' do
    city = "denver,co"

    data = MapQuestService.get_location(city)

    expect(data).to have_key(:results)
    expect(data[:results]).to be_an Array
    expect(data[:results][0]).to have_key(:locations)
    expect(data[:results][0][:locations]).to be_an Array
    expect(data[:results][0][:locations][0]).to have_key(:latLng)
    expect(data[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(data[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end
end
