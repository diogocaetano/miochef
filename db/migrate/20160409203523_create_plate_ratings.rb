class CreatePlateRatings < ActiveRecord::Migration
  def change
    create_table :plate_ratings do |t|
      t.references :client, index: true
      t.references :plate, index: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
