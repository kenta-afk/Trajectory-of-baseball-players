class GroupsController < ApplicationController
    def index
      @groups = current_user.groups
    end
  
    def new
      @group = Group.new
      @group.build_status
    end
  
    def create
      @group = Group.new(group_params)
  
      if @group.save
        # グループを作成したユーザーをメンバーとして追加
        @group.group_users.create(user: current_user)
        redirect_to @group, notice: 'Group was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @group = Group.find(params[:id])
      @members = @group.group_users
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, status_attributes: [:user_id, :group_id])
    end
  end
  