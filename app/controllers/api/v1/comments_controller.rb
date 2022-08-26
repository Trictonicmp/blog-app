class Api::V1::CommentsController < ApplicationController
  def index
    post_id = params[:post_id]
    @comments = Comment.all.where(post_id: post_id).order(created_at: :desc)
    render json: @comments
  end
end