class AddClientModuleToPermissions < ActiveRecord::Migration
  def change
  	modules_category = ModulesCategory.create(name: 'Clientes', icon: 'fa fa-users')

  	entity = Entity.create(
  		modules_category_id: modules_category.id, 
  		name: 'Clientes', 
  		controller: 'clients', 
  		slug: 'clients',
  		is_dev: false, 
  		visible: true
  	)

  	Permission.create(entity_id: entity.id, action_name: 'Listar', action: 'index')
	Permission.create(entity_id: entity.id, action_name: 'Criar', action: 'new')
	Permission.create(entity_id: entity.id, action_name: 'Salvar', action: 'create')
	Permission.create(entity_id: entity.id, action_name: 'Editar', action: 'edit')
	Permission.create(entity_id: entity.id, action_name: 'Atualizar', action: 'update')
	Permission.create(entity_id: entity.id, action_name: 'Visualizar', action: 'show')
	Permission.create(entity_id: entity.id, action_name: 'Remover', action: 'destroy')

	Permission.where(entity_id: entity.id).all.each do |permission|
		PermissionsRoles.create(role_id: 1, permission_id: permission.id)
		PermissionsRoles.create(role_id: 2, permission_id: permission.id)
	end
  end
end
