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