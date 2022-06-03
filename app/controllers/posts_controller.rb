class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id:"DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:category_id,:content,:text,:store_name).merge(user_id: current_user.id)
  end
end
