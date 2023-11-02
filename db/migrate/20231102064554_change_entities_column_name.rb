class ChangeEntitiesColumnName < ActiveRecord::Migration[7.0]
  def change
    # Rename the column from entities_id to group_id
    rename_column :entities, :entities_id, :group_id

    # Add a foreign key constraint to reference the groups table
    add_foreign_key :entities, :groups, column: :group_id
  end
end
