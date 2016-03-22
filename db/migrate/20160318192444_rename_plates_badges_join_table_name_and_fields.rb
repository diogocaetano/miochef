class RenamePlatesBadgesJoinTableNameAndFields < ActiveRecord::Migration
  def change
  	rename_table :plates_badges, :plate_badges_plates
  	rename_column :plate_badges_plates, :badge_id, :plate_badge_id
  end
end
