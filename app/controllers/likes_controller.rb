class LikesController < ApplicationController
  def create
    @current_post = Post.find(params[:post_id])
    @current_post.likes.new(author: current_user)
    if @current_post.save
      flash[:success] = "Like added!"
      redirect_to user_path(id: params[:user_id], id: params[:post_id])
    else
      flash.now[:error] = "Error: Like could not be added"
      render :new
    end
  end

  def destroy
    @current_post = Post.find(params[:post_id])
    @current_post.likes.where(author_id: current_user.id).destroy_all
  end
end
