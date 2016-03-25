class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)


    if @post.save!
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash.now[:alert] = "There was a problem saving the post"
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :description, :picture, :picture_cache)
  end
end
