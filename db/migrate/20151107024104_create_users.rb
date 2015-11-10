class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role, index: true, foreign_key: true
      t.string :name
      t.boolean :is_dev, default: false

      t.timestamps null: false
    end
  end
end
