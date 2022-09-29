Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :forecasts, only: [:index]
    end
  end

  post '/api/v1/users', to: 'api/v1/users#create'
  post '/api/v1/sessions', to: 'api/v1/sessions#create'
  post '/api/v1/road_trip', to: 'api/v1/road_trips#create'
end
