class AddFlagsToPlates < ActiveRecord::Migration
  def change
  	add_column :plates, :sunday_available, :integer
  	add_column :plates, :monday_available, :integer
  	add_column :plates, :tuesday_available, :integer
  	add_column :plates, :wednesday_available, :integer
  	add_column :plates, :thursday_available, :integer
  	add_column :plates, :friday_available, :integer
  	add_column :plates, :saturday_available, :integer
  end
end
