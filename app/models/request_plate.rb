class RequestPlate < ActiveRecord::Base
	
	belongs_to :plate, inverse_of: :request_plates
	belongs_to :request, inverse_of: :request_plates

	accepts_nested_attributes_for :plate
	accepts_nested_attributes_for :request
end
