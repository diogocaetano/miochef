class CreatePermissionsRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps null: false
    end
  end
end
