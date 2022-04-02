class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @comment = current_user.comments.new(comments_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_posts_path(current_user.id, @comment.post)
    else
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:Text)
  end
end
