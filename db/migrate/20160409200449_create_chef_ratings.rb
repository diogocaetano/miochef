class CreateChefRatings < ActiveRecord::Migration
  def change
    create_table :chef_ratings do |t|
      t.references :client, index: true
      t.references :chef, index: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
