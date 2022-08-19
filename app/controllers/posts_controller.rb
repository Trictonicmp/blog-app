class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author: @user).order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @comment = Comment.new
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end

  def new
    @new_post = Post.new
    @current_user = current_user
  end

  def create
    permits = params.require(:post).permit(:title, :text)
    text = permits[:text]
    title = permits[:title]
    @new_post = Post.new(author: current_user, text: text, title: title)

    if @new_post.save
      flash[:success] = "Post added!"
      redirect_to user_post_path(id: current_user.id)
    else
      flash.now[error] = "Error, post could not be saved"
      render :new
    end
  end
end
