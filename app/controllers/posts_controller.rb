class PostsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author_id: params[:id])
  end

  def show; end
end
