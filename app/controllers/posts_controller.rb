class PostsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author: @user).order(created_at: :desc)
  end

  def show; end
end
