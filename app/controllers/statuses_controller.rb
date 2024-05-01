class StatusesController < ApplicationController
  
  def index
    @group = Group.find(params[:group_id])
    @members = @group.group_users
  end
  
  
  

  def edit
    @status = Status.find(params[:id])
    @group = @status.group
    @user = @status.user
  end

  def update
    @group = Group.find(params[:id])
    @status = Status.find(params[:id])
    if @status.update(status_params)
      flash[:success] = "Status updated"
    else
      flash[:error] = "Failed to update status"
    end
    redirect_to group_path(@group)
  end

  private

  def status_params
    params.require(:status).permit(:id, :user_id, :group_id, :date, :opponent, :at_bats, :hits, :pitches, :walks, :batting_average)
  end
end
