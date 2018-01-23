class AddUniqueIndexToPermissions < ActiveRecord::Migration
  def change
    add_index :permissions, [:patient_id, :user_id], unique: true
  end
end
