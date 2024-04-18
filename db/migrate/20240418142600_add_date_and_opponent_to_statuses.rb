class AddDateAndOpponentToStatuses < ActiveRecord::Migration[7.1]
    def change
      add_column :statuses, :date, :date
      add_column :statuses, :opponent, :string
    end
end
  