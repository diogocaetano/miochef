class RequestPlate < ActiveRecord::Base
	#attr_accessible :quantity, :price, :plate_id, :request_id, :request_plate_attributes

	belongs_to :plate
	belongs_to :request
end
