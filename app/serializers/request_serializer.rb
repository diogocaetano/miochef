class RequestSerializer < ActiveModel::Serializer
  attributes :id, :references, :references, :payment_code, :request_date, :delivery_date, :delivery_window, :references
end
