# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.find_or_create_by([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.find_or_create_by(name: 'Emanuel', city: cities.first)

Role.find_or_create_by(name: 'Dev')
Role.find_or_create_by(name: 'Teste')
User.find_or_create_by(name: 'Develop') do |user|
	user.email = 'dev@dev.com'
	user.password = 'teste123'
	user.is_dev = true
	user.role_id = 1
end
User.find_or_create_by(name: 'Teste') do |user|
	user.email = 'teste@teste.com.br'
	user.password = 'teste123'
	user.role_id = 2
end

ModulesCategory.find_or_create_by(name: 'Controle de Acesso', icon: 'fa fa-cogs')
ModulesCategory.find_or_create_by(name: 'Localização', icon: 'fa fa-location-arrow')
ModulesCategory.find_or_create_by(name: 'Chefes', icon: 'fa fa-coffee')

Entity.find_or_create_by(modules_category_id: 1, name: 'Perfis', controller: 'roles', slug: 'roles',is_dev: false)
Entity.find_or_create_by(modules_category_id: 1, name: 'Usuários', controller: 'users', slug: 'users_admin',is_dev: false)
Entity.find_or_create_by(modules_category_id: 1, name: 'Permissões', controller: 'permissions', slug: 'permissions',is_dev: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Módulos', controller: 'entities', slug: 'entities',is_dev: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Categoria de Módulos', controller: 'modules_categories', slug: 'modules_categories',is_dev: true)
Entity.find_or_create_by(modules_category_id: 2, name: 'Países', controller: 'countries', slug: 'countries', is_dev: false)
Entity.find_or_create_by(modules_category_id: 3, name: 'Badges', controller: 'badges', slug: 'badges', is_dev: false)

Permission.find_or_create_by(entity_id: 1, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 1, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 1, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 1, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 1, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 1, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 1, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 2, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 2, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 2, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 2, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 2, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 2, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 2, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 3, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 3, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 3, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 3, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 3, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 3, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 3, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 4, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 4, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 4, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 4, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 4, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 4, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 4, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 5, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 5, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 5, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 5, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 5, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 5, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 5, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 6, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 6, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 6, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 6, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 6, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 6, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 6, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 7, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 7, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 7, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 7, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 7, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 7, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 7, action_name: 'Remover', action: 'destroy')

# Pratos - 16/03/2016
ModulesCategory.find_or_create_by(name: 'Pratos', icon: 'fa fa-spoon')
pratosCategory = ModulesCategory.find_by(name: 'Pratos')

Entity.find_or_create_by(controller: 'ingredients') do |entity|
	entity.modules_category_id = pratosCategory.id
	entity.controller = 'ingredients'
	entity.name = 'Ingredientes'
	entity.slug = 'ingredients'
	entity.is_dev = false
end

ingredientsCategory = Entity.find_by(name: 'Ingredientes')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: ingredientsCategory.id, action_name: 'Remover', action: 'destroy')

Entity.find_or_create_by(controller: 'plate_badges') do |badgeEntity|
	badgeEntity.modules_category_id = pratosCategory.id
	badgeEntity.name = 'Badges de Prato'
	badgeEntity.slug = 'plate_badges'
	badgeEntity.controller = 'plate_badges'
	badgeEntity.is_dev = false
end

badgesCategory = Entity.find_by(controller: 'plate_badges')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: badgesCategory.id, action_name: 'Remover', action: 'destroy')


Entity.find_or_create_by(controller: 'plate_types') do |typeEntity|
	typeEntity.modules_category_id = pratosCategory.id
	typeEntity.name = 'Tipos'
	typeEntity.slug = 'plate_types'
	typeEntity.controller = 'plate_types'
	typeEntity.is_dev = false
end

typesCategory = Entity.find_by(controller: 'plate_types')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: typesCategory.id, action_name: 'Remover', action: 'destroy')

Entity.find_or_create_by(controller: 'plate_accompaniments') do |accompanimentsEntity|
	accompanimentsEntity.modules_category_id = pratosCategory.id
	accompanimentsEntity.name = 'Acompanhamentos'
	accompanimentsEntity.slug = 'plate_accompaniments'
	accompanimentsEntity.controller = 'plate_accompaniments'
	accompanimentsEntity.is_dev = false
end

accompanimentsCategory = Entity.find_by(controller: 'plate_accompaniments')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Remover', action: 'destroy')



Permission.all.each do |permission|
	PermissionsRoles.find_or_create_by(role_id: 1, permission_id: permission.id)
	if not permission.entity.is_dev
		PermissionsRoles.find_or_create_by(role_id: 2, permission_id: permission.id)
	end
end