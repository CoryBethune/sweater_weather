class Api::V1::ForecastsController > ApplicationController

  def index
    location = MapQuestFacade.get_location(params[:location])
    
  end
end
