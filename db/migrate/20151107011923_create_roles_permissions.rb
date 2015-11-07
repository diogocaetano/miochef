class CreateRolesPermissions < ActiveRecord::Migration
  def change
    create_table :roles_permissions do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps null: false
    end
  end
end
