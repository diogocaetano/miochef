class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :entity, index: true, foreign_key: true      
      t.string :action_name
      t.string :action

      t.timestamps null: false
    end
  end
end
