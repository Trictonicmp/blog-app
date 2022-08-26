class Api::V1::PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @posts = Post.all.where(author_id: user_id).order(created_at: :desc)
    render json: @posts
  end
end
