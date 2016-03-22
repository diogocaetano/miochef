class RenamePlatesIngredientsJoinTable < ActiveRecord::Migration
  def change
  	rename_table :plates_ingredients, :ingredients_plates
  end
end
