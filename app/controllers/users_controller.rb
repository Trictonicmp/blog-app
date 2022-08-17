class UsersController < ApplicationController
  def index
    @users = User.all.order(name: :asc)
  end

  def show; end
end
