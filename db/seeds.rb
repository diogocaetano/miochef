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

m_control = ModulesCategory.find_or_create_by(name: 'Controle de Acesso', icon: 'fa fa-user')
m_locale = ModulesCategory.find_or_create_by(name: 'Localização', icon: 'fa fa-flag')
m_chef = ModulesCategory.find_or_create_by(name: 'Chefs', icon: 'fa fa-coffee')

e_perfil = Entity.find_or_create_by(modules_category_id: m_control.id, name: 'Perfis', controller: 'roles', slug: 'roles',is_dev: false, visible: true)
e_user = Entity.find_or_create_by(modules_category_id: m_control.id, name: 'Usuários', controller: 'users', slug: 'users_admin',is_dev: false, visible: true)
e_permission = Entity.find_or_create_by(modules_category_id: m_control.id, name: 'Permissões', controller: 'permissions', slug: 'permissions',is_dev: true, visible: true)
e_enity = Entity.find_or_create_by(modules_category_id: m_control.id, name: 'Módulos', controller: 'entities', slug: 'entities',is_dev: true, visible: true)
e_category_m = Entity.find_or_create_by(modules_category_id: m_control.id, name: 'Categoria de Módulos', controller: 'modules_categories', slug: 'modules_categories',is_dev: true, visible: true)
e_country = Entity.find_or_create_by(modules_category_id: m_locale.id, name: 'Países', controller: 'countries', slug: 'countries', is_dev: false, visible: true)
e_baged = Entity.find_or_create_by(modules_category_id: m_chef.id, name: 'Badges', controller: 'badges', slug: 'badges', is_dev: false, visible: true)
e_chef = Entity.find_or_create_by(modules_category_id: m_chef.id, name: 'Chefs', controller: 'chefs', slug: 'chefs', is_dev: false, visible: true)
e_adresse_chef = Entity.find_or_create_by(modules_category_id: m_chef.id, name: 'Endereços de Chef', controller: 'addresses', slug: 'addresses', is_dev: false, visible: false)
e_chef_type = Entity.find_or_create_by(modules_category_id: m_chef.id, name: 'Tipos de Chef', controller: 'chef_types', slug: 'chef_types', is_dev: false, visible: true)

Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_perfil.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Remover', action: 'destroy')
Permission.find_or_create_by(entity_id: e_user.id, action_name: 'Editar Todas as Senhas', action: 'update_all_passwords')

Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_permission.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_enity.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_category_m.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_country.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_baged.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_chef.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_adresse_chef.id, action_name: 'Remover', action: 'destroy')

Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: e_chef_type.id, action_name: 'Remover', action: 'destroy')

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
Permission.find_or_create_by(entity_id: chefAddressCategory.id, action_name: 'Buscar Endereços', action: 'get_client_addresses')


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
Permission.find_or_create_by(entity_id: dailyMenuCategory.id, action_name: 'Pegar Pratos do Dia', action: 'get_plates_from_date')

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
Permission.find_or_create_by(entity_id: requestsCategory.id, action_name: 'Atualizar Status', action: 'update_status')

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

# CHEFS
# Rating de Chefs
chefsModule = ModulesCategory.find_by(name: 'Chefs')
Entity.find_or_create_by(controller: 'chef_ratings') do |requestEntity|
	requestEntity.modules_category_id = chefsModule.id
	requestEntity.name = 'Rating de Chef'
	requestEntity.slug = 'chef_ratings'
	requestEntity.controller = 'chef_ratings'
	requestEntity.is_dev = false
	requestEntity.visible = true
end

chefsCategory = Entity.find_by(controller: 'chef_ratings')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: chefsCategory.id, action_name: 'Remover', action: 'destroy')

# PRATOS
# Rating de Pratos
platesModule = ModulesCategory.find_by(name: 'Pratos')
Entity.find_or_create_by(controller: 'plate_ratings') do |requestEntity|
	requestEntity.modules_category_id = platesModule.id
	requestEntity.name = 'Rating de Pratos'
	requestEntity.slug = 'plate_ratings'
	requestEntity.controller = 'plate_ratings'
	requestEntity.is_dev = false
	requestEntity.visible = true
end

platesCategory = Entity.find_by(controller: 'plate_ratings')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: platesCategory.id, action_name: 'Remover', action: 'destroy')

# BANNERS
# Portal
ModulesCategory.find_or_create_by(name: 'Banners', icon: 'fa fa-file-image-o')
bannersCategory = ModulesCategory.find_by(name: 'Banners')

Entity.find_or_create_by(controller: 'portal_banners') do |entity|
	entity.modules_category_id = bannersCategory.id
	entity.controller = 'portal_banners'
	entity.name = 'Portal'
	entity.slug = 'portal_banners'
	entity.is_dev = false
end

portalBannerCategory = Entity.find_by(slug: 'portal_banners')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Listar', action: 'index')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Criar', action: 'new')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Salvar', action: 'create')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Editar', action: 'edit')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Atualizar', action: 'update')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Visualizar', action: 'show')
Permission.find_or_create_by(entity_id: portalBannerCategory.id, action_name: 'Remover', action: 'destroy')



Permission.all.each do |permission|
	PermissionsRoles.find_or_create_by(role_id: 1, permission_id: permission.id)
	if not permission.entity.is_dev
		PermissionsRoles.find_or_create_by(role_id: 2, permission_id: permission.id)
	end
end