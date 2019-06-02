class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(get_users(params["user_type"])), status: 200
  end

  private

  def get_users(type)
    return User.all unless type
    return User.regular if type == "regular"
    return User.merchant if type == "merchant"
    return User.admin if type == "admin"
  end
end
