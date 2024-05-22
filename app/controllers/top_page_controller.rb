class TopPageController < ApplicationController
    def index
        @statuses = Status.where(user_id: current_user.id)
        @total_at_bats = @statuses.sum(:at_bats)
        @total_hits = @statuses.sum(:hits)
        @total_pitches = @statuses.sum(:pitches)
        @total_walks = @statuses.sum(:walks)
        @average_batting_average = @statuses.average(:batting_average)
    end
end
