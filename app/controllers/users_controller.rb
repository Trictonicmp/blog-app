class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(name: :asc)
  end

  def show
    @user = User.find(params['id'])
  end
end
