class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[update destroy ]

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_url(@project)
    else
      redirect_to project_path(@project), status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_url(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to project_url(@project), notice: "Task was successfully destroyed."
  end

  private
    def set_project
      @project = Project.find(params[:project_id])

    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :completed, :project_id)
    end
end
