class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        render json: UserSerializer.user(user), status: 201
      else
        render json: { errors: user.errors.full_messages }, status: 401
      end
    else
      render json: { errors: "Password and password confirmation fields must match." }, status: 401
    end
  end

end
