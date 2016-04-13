class Request < ActiveRecord::Base
  belongs_to :client
  belongs_to :client_address, class_name: 'Address'
  belongs_to :request_status

  validates :client_id, :client_address_id, :payment_code, :request_date, :delivery_date, :delivery_window, :request_status_id, presence: true
end
