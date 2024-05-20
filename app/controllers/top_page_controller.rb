class TopPageController < ApplicationController
    def index
        @statuses = Status.where(user_id: current_user.id)
    end
end
