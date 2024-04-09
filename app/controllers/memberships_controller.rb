class MembershipsController < ApplicationController
  def new
    @group_user = GroupUser.new
  end

  def create
    @group = Group.find_by(uuid: group_user_params[:uuid])
    @group_user = @group.group_users.build(user: current_user)
  
    if @group_user.save
      @status = Status.create(user_id: current_user.id, group_id: @group.id)
      redirect_to @group, notice: 'You joined the group.'
    else
      render :new
    end
  end
  
  
  def group_user_params
    params.require(:group_user).permit(:uuid, status_attributes: [:user_id, :group_id])
  end
  
end
