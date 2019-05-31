class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all), status: 200
  end
end
