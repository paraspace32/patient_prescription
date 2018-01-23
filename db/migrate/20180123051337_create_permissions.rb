class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :patient
      t.references :user
      t.boolean :permit, default: false

      t.timestamps null: false
    end
  end
end
