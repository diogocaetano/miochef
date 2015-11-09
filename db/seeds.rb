# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'Dev')
User.create(name: 'Develop', email: 'dev@dev.com', password: 'teste123', is_admin: true, is_representative: true, role_id: 1)

ModulesCategory.create(name: 'Controle de Acesso', icon: 'fa fa-cogs')

Entity.create(modules_category_id: 1, name: 'Perfis', slug: 'roles', controller: 'roles_controller', is_dev: false)
Entity.create(modules_category_id: 1, name: 'Usuários', slug: 'users', controller: 'users_controller', is_dev: false)
Entity.create(modules_category_id: 1, name: 'Permissões', slug: 'permissions', controller: 'permissions_controller', is_dev: false)
Entity.create(modules_category_id: 1, name: 'Módulos', slug: 'entities', controller: 'entities_controller', is_dev: false)

Permission.create(entity_id: 1, route: 'roles', action_name: 'Listar')
Permission.create(entity_id: 1, route: 'new_role', action_name: 'Criar')
Permission.create(entity_id: 1, route: 'edit_role', action_name: 'Editar')
Permission.create(entity_id: 1, route: 'role', action_name: 'Visualizar')

Permission.create(entity_id: 2, route: 'users', action_name: 'Listar')
Permission.create(entity_id: 2, route: 'new_user', action_name: 'Criar')
Permission.create(entity_id: 2, route: 'edit_user', action_name: 'Editar')
Permission.create(entity_id: 2, route: 'user', action_name: 'Visualizar')

Permission.create(entity_id: 3, route: 'permissions', action_name: 'Listar')
Permission.create(entity_id: 3, route: 'new_permission', action_name: 'Criar')
Permission.create(entity_id: 3, route: 'edit_permission', action_name: 'Editar')
Permission.create(entity_id: 3, route: 'permission', action_name: 'Visualizar')

Permission.create(entity_id: 4, route: 'entities', action_name: 'Listar')
Permission.create(entity_id: 4, route: 'new_entity', action_name: 'Criar')
Permission.create(entity_id: 4, route: 'edit_entity', action_name: 'Editar')
Permission.create(entity_id: 4, route: 'entity', action_name: 'Visualizar')

Permission.all.each do |permission|
	PermissionsRoles.create(role_id: 1, permission_id: permission.id)
end