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

	def get_activate_or_deactivate_action_button plate
		if plate.active == 1 
          return link_to raw("<i class='fa fa-power-off'></i>"), '#deactivate_plate_'+plate.id.to_s, :class => 'btn btn-success', :'data-toggle' => 'modal'  
        else 
          return link_to raw("<i class='fa fa-power-off'></i>"), '#activate_plate_'+plate.id.to_s, :class => 'btn btn-danger', :'data-toggle' => 'modal'  
        end 
	end
end
