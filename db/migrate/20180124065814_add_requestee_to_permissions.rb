class AddRequesteeToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :requestee, :string
  end
end
