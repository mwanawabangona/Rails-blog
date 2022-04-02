class LikesController < ApplicationController
  before_action :current_user, only: [:create]

  def create
   @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id: @post.id, users_id: current_user.id)
    if @like.save
      redirect_to user_posts_path(current_user.id, @post)
    else
      render :new
    end
  end
end
