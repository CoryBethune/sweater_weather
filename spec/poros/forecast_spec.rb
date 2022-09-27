require "rails_helper"

RSpec.describe "Forecast Poro" do
  it "creates an intance of Forecast" do
    forecast = OpenWeatherFacade.get_weather(39.738453, -104.984853)

    expect(forecast.daily).to be_an(Array)
    expect(forecast.hourly).to be_an(Array)
    expect(forecast.current).to be_an(Hash)
  end
end
