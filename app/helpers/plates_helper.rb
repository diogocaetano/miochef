module PlatesHelper
	def get_plate_active_label plate
		(plate.active == 1) ? "Ativo" : "Inativo"
	end
end
