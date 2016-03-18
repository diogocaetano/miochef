class CreatePlatesAccompanimentsJoinTable < ActiveRecord::Migration
  def change
  	create_table :plates_accompaniments, id: false do |t|
		t.integer :plate_id
		t.integer :accompaniment_id
    end
  end
end
