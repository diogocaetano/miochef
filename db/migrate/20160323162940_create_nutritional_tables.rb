class CreateNutritionalTables < ActiveRecord::Migration
  def change
    create_table :nutritional_tables do |t|
      t.decimal :energetic_value, precision: 10, scale: 2
      t.string :carbohydrate
      t.string :protein
      t.string :total_fat
      t.string :saturated_fat
      t.string :trans_fat
      t.string :dietary_fiber
      t.string :sodium
      t.string :iron

      t.timestamps null: false
    end
  end
end
