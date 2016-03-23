class AddNutritionalTablesRefToPlates < ActiveRecord::Migration
  def change
    add_reference :plates, :nutritional_table, index: true, foreign_key: true
  end
end
