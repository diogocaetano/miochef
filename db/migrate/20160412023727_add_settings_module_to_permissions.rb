class AddSettingsModuleToPermissions < ActiveRecord::Migration
  def change
  	modules_category = ModulesCategory.create(name: 'Configurações', icon: 'fa fa-cogs')

  	entity = Entity.create(
  		modules_category_id: modules_category.id, 
  		name: 'Configurações', 
  		controller: 'settings', 
  		slug: 'settings',
  		is_dev: false, 
  		visible: true
  	)

  	Permission.create(entity_id: entity.id, action_name: 'Editar', action: 'edit')
    Permission.create(entity_id: entity.id, action_name: 'Atualizar', action: 'update') 
    Permission.create(entity_id: entity.id, action_name: 'Listar', action: 'index') 
  	Permission.create(entity_id: entity.id, action_name: 'Visualizar', action: 'show')	
    
  	Permission.where(entity_id: entity.id).all.each do |permission|
  		PermissionsRoles.create(role_id: 1, permission_id: permission.id)
  		PermissionsRoles.create(role_id: 2, permission_id: permission.id)
  	end
  end
end
