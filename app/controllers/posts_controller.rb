class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @project = @post.project
  end

  def new
    @project = Project.find(params[:project_id])
    @post = current_user.posts.build
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.build(post_params)
    @post.user = current_user


    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved"
      redirect_to [@project, @post]
    else
      flash.now[:alert] = "There was a problem saving the post"
      render :new
    end
  end

  def edit
  end

  def update
    @post.assign_attributes(post_params)

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved"
      redirect_to [@post.project, @post]
    else
      flash.now[:alert] = "There was a problem saving the post"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.project
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :embedlink, :picture, :picture_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
