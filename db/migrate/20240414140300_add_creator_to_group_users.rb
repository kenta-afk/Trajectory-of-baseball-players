class AddCreatorToGroupUsers < ActiveRecord::Migration[7.1]
    def change
      add_column :group_users, :creator, :boolean, default: false
    end
end
  