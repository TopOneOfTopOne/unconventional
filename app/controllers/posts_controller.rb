class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.build(post_params)
    @post.user = current_user


    if @post.save!
      flash[:notice] = "Post was saved"
      redirect_to [@project, @post]
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
      redirect_to [@post.project, @post]
    else
      flash.now[:alert] = "There was a problem saving the post"
      render :edit
    end
  end

  def destroy
  @post = Post.find(params[:id])

  if @post.destroy
    flash[:notice] = "\"#{@post.title}\" was deleted successfully."
    redirect_to @post.project
  else
    flash.now[:alert] = "There was an error deleting the post."
    render :show
  end
end

  def post_params
    params.require(:post).permit(:title, :description, :picture, :picture_cache)
  end
end
