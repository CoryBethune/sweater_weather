class Api::V1::ForecastsController < ApplicationController

  def index
    location = MapQuestFacade.get_location(params[:location])
    forecast = OpenWeatherFacade.get_weather(location.lat, location.lon)
    render json: ForecastSerializer.new_forecast(forecast)
  end
end
