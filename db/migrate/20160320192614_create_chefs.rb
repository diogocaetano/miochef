class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.text :description
      t.string :cpf
      t.string :rg
      t.date :born_date
      t.references :country, index: true, foreign_key: true
      t.string :email
      t.string :phone_one
      t.string :phone_two
      t.string :specialty
      t.string :naturalness
      t.string :academic_education
      t.string :university
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
