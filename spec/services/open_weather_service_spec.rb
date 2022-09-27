require "rails_helper"

RSpec.describe "Open Weather Api Call" do
  it "gets weather data based on lat and lon coordinates" do
    data = OpenWeatherService.get_weather(33.448204, -112.072585)

    expect(data).to have_key(:current)
    expect(data).to have_key(:hourly)
    expect(data).to have_key(:daily)
    expect(data).to_not have_key(:alerts)
    expect(data).to_not have_key(:minutely)

    expect(data[:lat]).to eq(33.4482)
    expect(data[:lon]).to eq(-112.0726)
    expect(data[:current]).to_not be(nil)
    expect(data[:hourly]).to_not be(nil)
    expect(data[:daily]).to_not be(nil)
  end
end
