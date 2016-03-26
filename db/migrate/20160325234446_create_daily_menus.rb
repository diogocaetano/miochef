class CreateDailyMenus < ActiveRecord::Migration
  def change
    create_table :daily_menus do |t|

      t.timestamps null: false
    end
  end
end
