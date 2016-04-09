class RequestStatus < ActiveRecord::Base
	has_many :requests
	validates :name, presence: true, uniqueness: true
end
