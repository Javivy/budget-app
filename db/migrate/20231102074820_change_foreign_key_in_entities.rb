class ChangeForeignKeyInEntities < ActiveRecord::Migration[7.0]
  def change
    # Drop the existing foreign key constraint referencing the 'users' table
    remove_foreign_key :entities, column: :group_id
  end
end
