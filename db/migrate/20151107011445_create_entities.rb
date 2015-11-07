class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.integer :modules_category_id
      t.string :name
      t.string :slug
      t.string :controller
      t.boolean :is_dev

      t.timestamps null: false
    end
  end
end
