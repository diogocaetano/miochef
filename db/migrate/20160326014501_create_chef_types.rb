class CreateChefTypes < ActiveRecord::Migration
  def change
    create_table :chef_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
