class Api::V1::SessionsController < ApplicationController
  def index
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.user(user), status: 200
    else
      render json: { errors: "The given credentials are not valid." }, status: 400
    end
  end
end
