class PostsController < ApplicationController
  def index; end

  def show; end
end
class PostsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts
    end
  
    def show
      @post = Post.find(params[:id])
      @user = User.find(@post.users_id)
      @comments = @post.comments
    end
  end
  