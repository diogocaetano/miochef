class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :nome
      t.integer :age

      t.timestamps null: false
    end
  end
end
