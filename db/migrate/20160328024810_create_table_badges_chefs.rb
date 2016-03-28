class CreateTableBadgesChefs < ActiveRecord::Migration
  def change
    create_table :badges_chefs do |t|
      t.references :badge, index: true, foreign_key: true
      t.references :chef, index: true, foreign_key: true
    end
  end
end
