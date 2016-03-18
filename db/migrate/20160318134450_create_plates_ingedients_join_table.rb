class CreatePlatesIngedientsJoinTable < ActiveRecord::Migration
  def change
  	create_table :plates_ingredients, id: false do |t|
		t.integer :plate_id
		t.integer :ingredient_id
    end
  end
end
