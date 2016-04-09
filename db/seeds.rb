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
ModulesCategory.find_or_create_by(name: 'Localização', icon: 'fa fa-flag')
ModulesCategory.find_or_create_by(name: 'Chefes', icon: 'fa fa-coffee')

Entity.find_or_create_by(modules_category_id: 1, name: 'Perfis', controller: 'roles', slug: 'roles',is_dev: false, visible: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Usuários', controller: 'users', slug: 'users_admin',is_dev: false, visible: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Permissões', controller: 'permissions', slug: 'permissions',is_dev: true, visible: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Módulos', controller: 'entities', slug: 'entities',is_dev: true, visible: true)
Entity.find_or_create_by(modules_category_id: 1, name: 'Categoria de Módulos', controller: 'modules_categories', slug: 'modules_categories',is_dev: true, visible: true)
Entity.find_or_create_by(modules_category_id: 2, name: 'Países', controller: 'countries', slug: 'countries', is_dev: false, visible: true)
Entity.find_or_create_by(modules_category_id: 3, name: 'Badges', controller: 'badges', slug: 'badges', is_dev: false, visible: true)
Entity.find_or_create_by(modules_category_id: 3, name: 'Chefes', controller: 'chefs', slug: 'chefs', is_dev: false, visible: true)
Entity.find_or_create_by(modules_category_id: 3, name: 'Endereços de Chefe', controller: 'addresses', slug: 'addresses', is_dev: false, visible: false)
Entity.find_or_create_by(modules_category_id: 3, name: 'Tipos de Chefe', controller: 'chef_types', slug: 'chef_types', is_dev: false, visible: true)

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

Permission.find_or_create_by(entity_id: 8, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 8, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 8, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 8, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 8, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 8, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 8, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 9, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 9, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 9, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 9, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 9, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 9, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 9, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: 10, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: 10, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: 10, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: 10, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: 10, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: 10, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: 10, action_name: 'Remover', action: 'destroy')

# Pratos - 16/03/2016
ModulesCategory.find_or_create_by(name: 'Pratos', icon: 'fa fa-cutlery')
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
	badgeEntity.visible = true
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
	typeEntity.visible = true
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
	accompanimentsEntity.visible = true
end

accompanimentsCategory = Entity.find_by(controller: 'plate_accompaniments')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: accompanimentsCategory.id, action_name: 'Remover', action: 'destroy')

Entity.find_or_create_by(controller: 'plates') do |platesEntity|
	platesEntity.modules_category_id = pratosCategory.id
	platesEntity.name = 'Pratos'
	platesEntity.slug = 'plates'
	platesEntity.controller = 'plates'
	platesEntity.is_dev = false
	platesEntity.visible = true
end

platesCategory = Entity.find_by(controller: 'plates')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Remover', action: 'destroy')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Ativar Prato', action: 'activate')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Desativar Prato', action: 'deactivate')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Cardápio do Dia', action: 'daily_menu')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Tabela Nutricional', action: 'nutritional_table')

chefsCategory = Entity.find_by(controller: 'chef_types')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Remover', action: 'destroy')

chefAddressCategory = Entity.find_by(controller: 'addresses')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Remover', action: 'destroy')


ModulesCategory.find_or_create_by(name: 'Cardápio do Dia', icon: 'fa fa-list')
dailyMenuModule = ModulesCategory.find_by(name: 'Cardápio do Dia')
Entity.find_or_create_by(controller: 'daily_menus') do |dailyMenuEntity|
	dailyMenuEntity.modules_category_id = dailyMenuModule.id
	dailyMenuEntity.name = 'Cardápio de Hoje'
	dailyMenuEntity.slug = 'daily_menus'
	dailyMenuEntity.controller = 'daily_menus'
	dailyMenuEntity.is_dev = false
	dailyMenuEntity.visible = true
end

dailyMenuCategory = Entity.find_by(controller: 'daily_menus')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Remover', action: 'destroy')

usersCategory = Entity.find_by(name: 'Usuários')
Permission.find_or_create_by(entity_id: usersCategory.id, action_name: 'Alterar Senha', action: 'update_password')

# PEDIDOS
ModulesCategory.find_or_create_by(name: 'Pedidos', icon: 'fa fa-shopping-cart')
requestModule = ModulesCategory.find_by(name: 'Pedidos')
Entity.find_or_create_by(controller: 'requests') do |requestEntity|
	requestEntity.modules_category_id = requestModule.id
	requestEntity.name = 'Pedidos'
	requestEntity.slug = 'requests'
	requestEntity.controller = 'requests'
	requestEntity.is_dev = false
	requestEntity.visible = true
end

requestsCategory = Entity.find_by(controller: 'requests')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Remover', action: 'destroy')

# Status dos Pedidos
Entity.find_or_create_by(controller: 'request_statuses') do |requestEntity|
	requestEntity.modules_category_id = requestModule.id
	requestEntity.name = 'Status do Pedido'
	requestEntity.slug = 'request_statuses'
	requestEntity.controller = 'request_statuses'
	requestEntity.is_dev = false
	requestEntity.visible = true
end

requestStatusesCategory = Entity.find_by(controller: 'request_statuses')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: requestStatusesCategory.id, action_name: 'Remover', action: 'destroy')

# Janela de Entrega
Entity.find_or_create_by(controller: 'window_requests') do |requestEntity|
	requestEntity.modules_category_id = requestModule.id
	requestEntity.name = 'Janela de Entrega'
	requestEntity.slug = 'window_requests'
	requestEntity.controller = 'window_requests'
	requestEntity.is_dev = false
	requestEntity.visible = true
end

windowRequestsCategory = Entity.find_by(controller: 'window_requests')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: windowRequestsCategory.id, action_name: 'Remover', action: 'destroy')



Permission.all.each do |permission|
	PermissionsRoles.find_or_create_by(role_id: 1, permission_id: permission.id)
	if not permission.entity.is_dev
		PermissionsRoles.find_or_create_by(role_id: 2, permission_id: permission.id)
	end
end