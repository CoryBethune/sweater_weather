require "rails_helper"

RSpec.describe "Open Weather Facade" do
  it "returns a Forecase poro" do
    forecast = OpenWeatherFacade.get_weather(39.738453, -104.984853)

    expect(forecast).to be_an(Forecast)
  end
end
