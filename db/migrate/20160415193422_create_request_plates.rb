class CreateRequestPlates < ActiveRecord::Migration
	def change
		create_table :request_plates do |t|
			t.references :plate
			t.references :request
			t.integer :quantity
			t.decimal :price
			t.timestamps null: false
    	end
  	end
end