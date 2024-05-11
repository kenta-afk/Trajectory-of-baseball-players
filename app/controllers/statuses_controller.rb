class StatusesController < ApplicationController
  
  def index
    @group = Group.find(params[:group_id])
    @members = @group.group_users
  end
  

  def new
    @group = Group.find(params[:group_id])
    @status = Status.new(user_id: params[:user_id], group_id: @group.id)
  end
  
  
  
  
  
  
  def create
    @group = Group.find(params[:group_id])
    @status = Status.new(status_params)
    @status.group_id = @group.id
  
    if @status.save
      flash[:success] = "Status created"
      redirect_to group_path(@group)
    else
      flash[:error] = "Failed to create status"
      render :new
    end
  end
  

  private

  def status_params
    params.require(:status).permit(:id, :user_id, :group_id, :date, :opponent, :at_bats, :hits, :pitches, :walks, :batting_average)
  end
  
end
