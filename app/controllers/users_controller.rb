class UsersController < ApplicationController
  def index
    @users = User.all.order(name: :asc)
    render json: @users
  end

  def show
    @user = User.find(params['id'])
  end
end
