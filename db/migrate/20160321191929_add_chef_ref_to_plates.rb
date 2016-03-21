class AddChefRefToPlates < ActiveRecord::Migration
  def change
    add_reference :plates, :chef, index: true, foreign_key: true
  end
end
