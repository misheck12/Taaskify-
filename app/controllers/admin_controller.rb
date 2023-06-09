class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_admin, only: [:index]
  
  def users
    @users = User.all
  end

  def tasks
    @tasks = Task.all
  end

  def manage
    # Retrieve the user or task based on the provided ID
    if params[:type] == 'user'
      @item = User.find(params[:id])
    elsif params[:type] == 'task'
      @item = Task.find(params[:id])
    end

    if request.post?
      if params[:commit] == 'Update'
        # Update the user or task attributes
        if @item.update(item_params)
          redirect_to admin_manage_path, notice: 'Item updated successfully.'
        else
          flash.now[:alert] = 'Failed to update the item.'
        end
      elsif params[:commit] == 'Delete'
        # Delete the user or task
        @item.destroy
        redirect_to admin_manage_path, notice: 'Item deleted successfully.'
      end
    end
  end

  private

  def item_params
    if params[:type] == 'user'
      params.require(:user).permit(:name, :email)
    elsif params[:type] == 'task'
      params.require(:task).permit(:title, :description, :status)
    end
  end
end
