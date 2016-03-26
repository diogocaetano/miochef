class AddChefTypeIdToChefs < ActiveRecord::Migration
  def change
    add_reference :chefs, :chef_type, index: true, foreign_key: true
  end
end
