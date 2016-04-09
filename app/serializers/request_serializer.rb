class RequestSerializer < ActiveModel::Serializer
  attributes :id, :payment_code, :request_date, :delivery_date, :delivery_window
  has_one :client
  has_one :client_address
  has_one :request_status
end
