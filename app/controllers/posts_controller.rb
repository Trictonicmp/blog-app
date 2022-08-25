class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author: @user).order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @comment = Comment.new
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @new_post = Post.new
    @current_user = current_user
  end

  def create
    permits = params.require(:post).permit(:title, :text)
    text = permits[:text]
    title = permits[:title]
    @new_post = Post.new(author: current_user, text:, title:)

    if @new_post.save
      flash[:success] = 'Post added!'
      redirect_to user_path(id: current_user.id)
    else
      flash.now[error] = 'Error, post could not be saved'
      render :new
    end
  end

  def destroy
    @current_post = Post.find(params[:id])
    Comment.where(post: @current_post).delete_all
    Like.where(post: @current_post).delete_all
    if @current_post.destroy
      flash[:success] = 'Post deleted'
      redirect_to user_path(id: current_user.id)
    end
  end
end
