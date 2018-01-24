class AddRequesteeTypeToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :requestee_type, :string
  end
end
