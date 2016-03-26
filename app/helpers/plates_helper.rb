module PlatesHelper
	def get_plate_active_label plate
		(plate.active == 1) ? "Ativo" : "Inativo"
	end

	def get_formatted_energetic_value plate
		if plate.nutritional_table.nil?
			return '0'
		else
			return number_to_currency(plate.nutritional_table.energetic_value, unit: "", separator: ",", delimiter: ".")
		end
	end

	def get_energetic_value plate
		if plate.nutritional_table.nil?
			return '0'
		else
			return plate.nutritional_table.energetic_value.to_s
		end
	end
end
