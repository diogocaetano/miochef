class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :entity, index: true, foreign_key: true
      t.string :route
      t.string :action_name

      t.timestamps null: false
    end
  end
end
