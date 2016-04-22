class RequestStatus < ActiveRecord::Base
	has_many :requests, dependent: :restrict_with_error
	validates :name, presence: true, uniqueness: true
end
