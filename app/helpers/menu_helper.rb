module MenuHelper

	def self.userHasPermissionToAnyModuleFromCategory?(user,category)
		category.entities.each do |entity|
			user.role.permissions.each do |permission|
				return true if permission.entity_id == entity.id
			end
		end

		false
	end

	def self.userHasPermissionToModule?(user,entity)
		user.role.permissions.each do |permission|
			return true if permission.entity_id == entity.id && entity.visible
		end

		false
	end

	def self.is_active_menu(category, entity=nil, module_active)		
        if not entity.nil?
            if entity.controller == module_active
                return "active"
            end
        else
        	category.entities.each do |entity|
                if entity.controller == module_active
                    return "active"
                end
            end
        end
    end
end
