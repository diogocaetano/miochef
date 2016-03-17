class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 10, scale: 2, default: nil
      t.integer :available_quantity, default: nil
      t.string :photo
      t.integer :active, default: 1
      t.references :chef, index: true, foreign_key: true
      t.references :plate_type, index: true, foreign_key: true
      t.references :plate_badge, index: true, foreign_key: true
      t.references :ingredients, index: true, foreign_key: true
      t.references :plate_accompaniment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
