class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :chef, index: true, foreign_key: true
      t.string :public_place
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :complement

      t.timestamps null: false
    end
  end
end
