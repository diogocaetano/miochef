class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :available_quantity
      t.string :photo
      t.integer :active
      t.references :plate_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
