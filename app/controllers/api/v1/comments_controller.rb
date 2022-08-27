class Api::V1::CommentsController < ApplicationController
  def index
    post_id = params[:post_id]
    @comments = Comment.all.where(post_id:).order(created_at: :desc)
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
