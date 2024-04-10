class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
        @group.build_status
    end

    def create
        
        @group = Group.new(group_params)
    
        if @group.save
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
        params.require(:group).permit(:name)
        params.require(:group).permit(:name, status_attributes: [:user_id, :group_id])
    end
end
