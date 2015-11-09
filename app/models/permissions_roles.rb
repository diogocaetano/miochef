class PermissionsRoles < ActiveRecord::Base
  belongs_to :role
  belongs_to :permissions
end
