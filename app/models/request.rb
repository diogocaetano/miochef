class Request < ActiveRecord::Base
  belongs_to :client
  belongs_to :client_address
  belongs_to :request_status
end
