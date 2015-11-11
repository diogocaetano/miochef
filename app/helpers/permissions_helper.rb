module PermissionsHelper
	def self.render_permissions_multiSelect(selectedPermissions, permission)
		selectedPermissions.each do |permissionRecord|
        	if permissionRecord.id == permission.id
        		return "<option selected value=#{permissionRecord.id}>#{permission.action_name}</option>".html_safe
        	end
   		end

   		"<option value=#{permission.id}>#{permission.action_name}</option>".html_safe
    end
end
