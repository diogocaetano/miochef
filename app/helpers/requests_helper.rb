module RequestsHelper
	include WindowRequestsHelper

	def get_formated_date date
		if date.nil? 
			return ''
		end

		date.strftime('%d/%m/%Y')
	end

	def get_plate_request request_id, plate_id
		plate_request = RequestPlate::where('request_id = ' + request_id.to_s).where('plate_id = ' + plate_id.to_s).first
	end

	def get_plate_request_quantity request_id, plate_id
		plate_request = get_plate_request(request_id, plate_id)
		if plate_request.nil?
			return '0'
		end
		plate_request.quantity.to_s
	end

	def get_plate_price request_id, plate
		plate_request = get_plate_request(request_id, plate.id)

		if not plate_request.nil?
			return plate_request.price
		end
		plate.price
	end
end
