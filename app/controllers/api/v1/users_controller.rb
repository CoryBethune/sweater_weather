class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.create!(email: params[:email], password: params[:password])
      render json: UserSerializer.new_user(user), status: 201
    end
  end

end
