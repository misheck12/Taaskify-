class EmployeesController < ApplicationController

  before_action :authenticate_user!
  before_action :authrize_employee, only: [:index]
  def index
    @tasks = Task.available_tasks
  end

  def accept
    @task = Task.available_tasks.find(params[:id])
    @task.update(status: "Accepted", freelancer_id: current_user.id)
    redirect_to employees_path, notice: "Task accepted successfully."
  end

  def completed
    @tasks = current_user.tasks.completed_tasks
  end
end
