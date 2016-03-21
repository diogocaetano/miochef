class RenamePlatesAccompanimentsJoinTable < ActiveRecord::Migration
  def change
  	rename_table :plates_accompaniments, :plate_accompaniments_plates
  	rename_column :plate_accompaniments_plates, :accompaniment_id, :plate_accompaniment_id
  end
end
