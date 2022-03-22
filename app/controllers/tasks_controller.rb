class TasksController < ApplicationController
  before_action :set_Task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_Task)
    @task.save!
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(params_Task)
    redirect_to task_path(@task)

  end

  def destroy
    @task.destroy

    redirect_to tasks_path
   end

  private

  def params_Task
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_Task
    @task = Task.find(params[:id])
  end
end
