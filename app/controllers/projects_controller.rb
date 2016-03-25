class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was created"
    else
      flash[:error] = "Error creating project. Please try again."
      render :new
    end
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
