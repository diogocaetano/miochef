class CreatePlatesBadgesJoinTable < ActiveRecord::Migration
  def change
  	create_table :plates_badges, id: false do |t|
		t.integer :plate_id
		t.integer :badge_id
    end
  end
end
