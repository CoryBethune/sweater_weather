class Api::V1::ForecastsController < ApplicationController

  def index
    location = MapQuestFacade.get_location(params[:location])
    forecast = OpenWeather.get_weather(location.lat, location.lon)
  end
end
