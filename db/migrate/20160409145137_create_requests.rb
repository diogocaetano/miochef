class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.client :references
      t.client_address :references
      t.string :payment_code
      t.datetime :request_date
      t.datetime :delivery_date
      t.string :delivery_window
      t.request_status :references

      t.timestamps null: false
    end
  end
end
