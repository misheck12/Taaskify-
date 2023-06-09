class CustomersController < ApplicationController

  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to customers_path, notice: "Task created successfully."
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to customers_path, notice: "Task deleted successfully."
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
