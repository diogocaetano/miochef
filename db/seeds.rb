# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'Dev')
Role.create(name: 'Teste')
User.create(name: 'Develop', email: 'dev@dev.com', password: 'teste123', is_dev: true, role_id: 1)
User.create(name: 'Teste', email: 'teste@teste.com.br', password: 'teste123', role_id: 2)

ModulesCategory.create(name: 'Controle de Acesso', icon: 'fa fa-cogs')

Entity.create(modules_category_id: 1, name: 'Perfis', controller: 'roles', slug: 'roles',is_dev: false)
Entity.create(modules_category_id: 1, name: 'Usuários', controller: 'users', slug: 'users_admin',is_dev: false)
Entity.create(modules_category_id: 1, name: 'Permissões', controller: 'permissions', slug: 'permissions',is_dev: true)
Entity.create(modules_category_id: 1, name: 'Módulos', controller: 'entities', slug: 'entities',is_dev: true)
Entity.create(modules_category_id: 1, name: 'Categoria de Módulos', controller: 'modules_categories', slug: 'modules_categories',is_dev: true)
Entity.create(modules_category_id: 1, name: 'dogs', controller: 'dogs', slug: 'dogs',is_dev: false)

Permission.create(entity_id: 1, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 1, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 1, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 1, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 1, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 1, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 1, action_name: 'Remover', action: 'destroy')

Permission.create(entity_id: 2, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 2, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 2, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 2, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 2, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 2, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 2, action_name: 'Remover', action: 'destroy')

Permission.create(entity_id: 3, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 3, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 3, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 3, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 3, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 3, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 3, action_name: 'Remover', action: 'destroy')

Permission.create(entity_id: 4, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 4, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 4, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 4, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 4, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 4, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 4, action_name: 'Remover', action: 'destroy')

Permission.create(entity_id: 5, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 5, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 5, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 5, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 5, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 5, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 5, action_name: 'Remover', action: 'destroy')

Permission.create(entity_id: 6, action_name: 'Listar', action: 'index')
Permission.create(entity_id: 6, action_name: 'Criar', action: 'new')
Permission.create(entity_id: 6, action_name: 'Salvar', action: 'create')
Permission.create(entity_id: 6, action_name: 'Editar', action: 'edit')
Permission.create(entity_id: 6, action_name: 'Atualizar', action: 'update')
Permission.create(entity_id: 6, action_name: 'Visualizar', action: 'show')
Permission.create(entity_id: 6, action_name: 'Remover', action: 'destroy')

Permission.all.each do |permission|
	PermissionsRoles.create(role_id: 1, permission_id: permission.id)
	if not permission.entity.is_dev
		PermissionsRoles.create(role_id: 2, permission_id: permission.id)
	end
end