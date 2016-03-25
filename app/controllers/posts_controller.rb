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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)


    if @post.save!
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash.now[:alert] = "There was a problem saving the post"
      render :edit
    end
  end

  def destroy
  @post = Post.find(params[:id])

  if @post.destroy
    flash[:notice] = "\"#{@post.title}\" was deleted successfully."
    redirect_to posts_path
  else
    flash.now[:alert] = "There was an error deleting the post."
    render :show
  end
end

  def post_params
    params.require(:post).permit(:title, :description, :picture, :picture_cache)
  end
end
