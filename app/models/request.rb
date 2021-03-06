class Request < ActiveRecord::Base
  belongs_to :client
  belongs_to :client_address, class_name: 'Address'
  belongs_to :request_status

  has_many :request_plates, -> (object) { where("quantity > 0") }
  has_many :plates, :through => :request_plates

  accepts_nested_attributes_for :plates
  accepts_nested_attributes_for :request_plates

  validates :client_id, :client_address_id, :payment_code, :request_date, :delivery_date, :delivery_window, :request_status_id, presence: true
end
