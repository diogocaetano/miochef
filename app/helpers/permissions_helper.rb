module PermissionsHelper
	def self.render_permissions_multiSelect(selectedPermissions, permission)
		selectedPermissions.each do |permissionRecord|
        	if permissionRecord.id == permission.id
        		return "<option selected value=#{permissionRecord.id}>#{permission.action_name}</option>".html_safe
        	end
   		end

   		"<option value=#{permission.id}>#{permission.action_name}</option>".html_safe
    end

    def self.render_permissions_selected_li(selectedPermissions, permission)
		selectedPermissions.each do |permissionRecord|
        	if permissionRecord.id == permission.id
        		return "<li class='list-group-item' >#{permission.action_name}</li>".html_safe
        	end
   		end
   		return "<li class='list-group-item disabled'>#{permission.action_name}</li>".html_safe
    end
end
