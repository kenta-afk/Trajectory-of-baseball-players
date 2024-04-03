class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.integer :at_bats
      t.integer :hits
      t.float :batting_average
      t.integer :walks
      t.integer :pitches

      t.timestamps
    end
  end
end
