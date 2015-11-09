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
			return true if permission.entity_id == entity.id
		end

		false
	end
end
