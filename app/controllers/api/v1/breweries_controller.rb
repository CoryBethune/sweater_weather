class Api::V1::BreweriesController < ApplicationController

  def index
    location = MapQuestFacade.get_location(params[:location])
    forecast = OpenWeatherFacade.get_weather(location.lat, location.lon)
    breweries = BreweriesFacade.get_breweries(params[:location], params[:quantity])
    render json: BreweriesSerializer.new_breweries(forecast, breweries, params[:location])
  end
end
