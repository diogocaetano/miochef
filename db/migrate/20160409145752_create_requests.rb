class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :client, index: true, foreign_key: true
      t.references :client_address, index: true, foreign_key: true
      t.string :payment_code
      t.datetime :request_date
      t.datetime :delivery_date
      t.string :delivery_window
      t.references :request_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
