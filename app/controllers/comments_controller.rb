class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
    @current_user = current_user
  end

  def create
    author_id = current_user.id
    post_id = params[:post_id]
    text_permit = params.require(:comment).permit(:text)
    text = text_permit[:text]
    @new_comment = Comment.new(author_id: author_id, post_id: post_id, text: text)

    if @new_comment.save
      flash[:success] = "Comment added!"
      redirect_to user_post_path(user_id: params[:user_id], id: post_id)
    else
      flash.now[:error] = "Error: Comment could not be added"
      render :new
    end
  end
end