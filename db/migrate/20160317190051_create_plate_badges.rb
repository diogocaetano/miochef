class CreatePlateBadges < ActiveRecord::Migration
  def change
    create_table :plate_badges do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
