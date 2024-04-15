class AddOnDeleteCascadeToStatusesForeignKey < ActiveRecord::Migration[7.1]
    def change
        remove_foreign_key :statuses, :groups
        add_foreign_key :statuses, :groups, on_delete: :cascade
    end
end