class AddOrderDateRangeConfig < ActiveRecord::Migration
  def change
  	setting = Setting.new
  	setting.key = 'order_date_ranger'
  	setting.name = 'Range de visualização de pedidos'
  	setting.value = 5
  	setting.save
  end
end