class CreatePlateAccompaniments < ActiveRecord::Migration
  def change
    create_table :plate_accompaniments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
