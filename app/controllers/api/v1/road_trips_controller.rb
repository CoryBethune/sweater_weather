class Api::V1::RoadTripsController < ApplicationController
  def create
    if User.find_by(auth_token: params[:api_key])
      trip_data = RoadTripFacade.get_road_trip(params[:origin], params[:destination])
      
      forecast = OpenWeatherFacade.get_weather(trip_data.lat, trip_data.lon)

      render json: RoadTripSerializer.new_trip(trip_data, forecast, params[:origin], params[:destination]), status: 200
    else
      render json: { errors: "Only registered users who are logged in can use this feature." }, status: 401
    end
  end
end
