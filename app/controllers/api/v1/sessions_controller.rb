class Api::V1::SessionsController < ApplicationController
  def index
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.user(user), status: 200
    else
      
    end
  end
end
