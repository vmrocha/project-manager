class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_url(@project), notice: "Project was successfully created."
    else
      redirect_to projects_path, status: :unprocessable_entity
    end
  end

  def update
      if @project.update(project_params)
        redirect_to project_url(@project), notice: "Project was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @project.destroy!

    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
