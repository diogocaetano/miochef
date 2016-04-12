class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :cep

      t.timestamps null: false
    end
  end
end
