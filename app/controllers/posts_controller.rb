class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.current
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(:root, notice: "Congratulations, you just shared your mind!")
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
