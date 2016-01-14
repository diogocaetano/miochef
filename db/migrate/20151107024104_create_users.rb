class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role, index: true, foreign_key: true
      t.string     :name
      t.boolean    :is_dev, default: false
      t.datetime   :token_expiration_time 
      t.string     :access_token

      t.timestamps null: false
    end
  end
end
