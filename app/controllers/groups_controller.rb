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
        # グループを作成したユーザーをメンバーとして追加し、creatorフラグをtrueに設定
        @group.group_users.create(user: current_user, creator: true)
        redirect_to @group, notice: 'Group was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @group = Group.find(params[:id])
      if @group.group_users.find_by(user: current_user)&.creator
        if @group.destroy
          redirect_to groups_path, notice: 'Group was successfully destroyed.'
        else
          redirect_to groups_path, alert: 'Group could not be destroyed.'
        end
      else
        redirect_to groups_path, alert: 'You are not authorized to delete this group.'
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
  