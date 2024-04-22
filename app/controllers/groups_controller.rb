class GroupsController < ApplicationController
    def index
      @groups = current_user.groups
    end
  
    def new
      @group = Group.new
      @group.statuses.build
    end
  
    def create
      @group = Group.new(group_params)
    
      if @group.save
        # グループを作成したユーザーをメンバーとして追加し、creatorフラグをtrueに設定
        @group.group_users.create(user: current_user, creator: true)
        
        # ここで各Statusのgroup_idを設定
        @group.statuses.each do |status|
          status.update(group_id: @group.id)
        end
    
        redirect_to @group, notice: 'Group was successfully created.'
      else
        render :new
      end
    end

    def edit
      @group = Group.find(params[:id])
      @members = @group.group_users
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

    def update
      @group = Group.find(params[:id])
      @group.group_users.each do |group_user|
        status = group_user.user.statuses.find_by(group: @group.id)
        if status.update(status_params)
          flash[:success] = "Status updated"
        else
          flash[:error] = "Failed to update status"
        end
      end
      redirect_to group_path(@group)
    end
    
    
  
    private
  
    def group_params
      params.require(:group).permit(:name, statuses_attributes: [:user_id, :group_id, :date, :opponent, :at_bats, :hits, :pitches, :walks, :batting_average])
    end

    def status_params
      params.require(:status).permit(:date, :opponent, :at_bats, :hits, :pitches, :walks, :batting_average)
    end
    
  end
  