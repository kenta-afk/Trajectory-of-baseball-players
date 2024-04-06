class AddUuidToGroups < ActiveRecord::Migration[7.1]
    def change
      add_column :groups, :uuid, :string
      add_index :groups, :uuid, unique: true
    end
  end
  