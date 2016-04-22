class CreateWindowRequests < ActiveRecord::Migration
  def change
    create_table :window_requests do |t|
      t.time :initial_time
      t.time :final_time

      t.timestamps null: false
    end
  end
end
