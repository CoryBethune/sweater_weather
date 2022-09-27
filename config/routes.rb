Rails.application.routes.draw do

  get '/api/v1/breweries', to: 'api/v1/breweries#index'

  namespace :api do
    namespace :v1 do
      resources :forecasts, only: [:index]
    end
  end

end
