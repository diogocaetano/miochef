# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160414134913) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "chef_id",      limit: 4
    t.string   "public_place", limit: 255
    t.string   "number",       limit: 255
    t.string   "neighborhood", limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "zip_code",     limit: 255
    t.string   "complement",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "main"
    t.integer  "client_id",    limit: 4
  end

  add_index "addresses", ["chef_id"], name: "index_addresses_on_chef_id", using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "badges", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "image",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "badges_chefs", force: :cascade do |t|
    t.integer "badge_id", limit: 4
    t.integer "chef_id",  limit: 4
  end

  add_index "badges_chefs", ["badge_id"], name: "index_badges_chefs_on_badge_id", using: :btree
  add_index "badges_chefs", ["chef_id"], name: "index_badges_chefs_on_chef_id", using: :btree

  create_table "chef_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "cpf",                limit: 255
    t.string   "rg",                 limit: 255
    t.date     "born_date"
    t.integer  "country_id",         limit: 4
    t.string   "email",              limit: 255
    t.string   "phone_one",          limit: 255
    t.string   "phone_two",          limit: 255
    t.string   "specialty",          limit: 255
    t.string   "naturalness",        limit: 255
    t.string   "academic_education", limit: 255
    t.string   "university",         limit: 255
    t.boolean  "active",                           default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.integer  "chef_type_id",       limit: 4
  end

  add_index "chefs", ["chef_type_id"], name: "index_chefs_on_chef_type_id", using: :btree
  add_index "chefs", ["country_id"], name: "index_chefs_on_country_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "last_name",              limit: 255
    t.string   "cep",                    limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "initials",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "flag",       limit: 255
  end

  create_table "daily_menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.integer  "modules_category_id", limit: 4
    t.string   "name",                limit: 255
    t.string   "slug",                limit: 255
    t.string   "controller",          limit: 255
    t.boolean  "is_dev"
    t.boolean  "visible",                         default: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ingredients_plates", id: false, force: :cascade do |t|
    t.integer "plate_id",      limit: 4
    t.integer "ingredient_id", limit: 4
  end

  create_table "modules_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "nutritional_tables", force: :cascade do |t|
    t.decimal  "energetic_value",             precision: 10, scale: 2
    t.string   "carbohydrate",    limit: 255
    t.string   "protein",         limit: 255
    t.string   "total_fat",       limit: 255
    t.string   "saturated_fat",   limit: 255
    t.string   "trans_fat",       limit: 255
    t.string   "dietary_fiber",   limit: 255
    t.string   "sodium",          limit: 255
    t.string   "iron",            limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "entity_id",   limit: 4
    t.string   "action_name", limit: 255
    t.string   "action",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "permissions", ["entity_id"], name: "index_permissions_on_entity_id", using: :btree

  create_table "permissions_roles", force: :cascade do |t|
    t.integer  "role_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "plate_accompaniments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plate_accompaniments_plates", id: false, force: :cascade do |t|
    t.integer "plate_id",               limit: 4
    t.integer "plate_accompaniment_id", limit: 4
  end

  create_table "plate_badges", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "image",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "plate_badges_plates", id: false, force: :cascade do |t|
    t.integer "plate_id",       limit: 4
    t.integer "plate_badge_id", limit: 4
  end

  create_table "plate_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plates", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.text     "description",          limit: 65535
    t.decimal  "price",                              precision: 10, scale: 2
    t.integer  "available_quantity",   limit: 4
    t.string   "photo",                limit: 255
    t.integer  "active",               limit: 4
    t.integer  "plate_type_id",        limit: 4
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "photo_file_name",      limit: 255
    t.string   "photo_content_type",   limit: 255
    t.integer  "photo_file_size",      limit: 4
    t.datetime "photo_updated_at"
    t.integer  "chef_id",              limit: 4
    t.integer  "sunday_available",     limit: 4
    t.integer  "monday_available",     limit: 4
    t.integer  "tuesday_available",    limit: 4
    t.integer  "wednesday_available",  limit: 4
    t.integer  "thursday_available",   limit: 4
    t.integer  "friday_available",     limit: 4
    t.integer  "saturday_available",   limit: 4
    t.integer  "nutritional_table_id", limit: 4
  end

  add_index "plates", ["chef_id"], name: "index_plates_on_chef_id", using: :btree
  add_index "plates", ["nutritional_table_id"], name: "index_plates_on_nutritional_table_id", using: :btree
  add_index "plates", ["plate_type_id"], name: "index_plates_on_plate_type_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id",                limit: 4
    t.string   "name",                   limit: 255
    t.boolean  "is_dev",                             default: false
    t.datetime "token_expiration_time"
    t.string   "access_token",           limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "addresses", "chefs"
  add_foreign_key "badges_chefs", "badges"
  add_foreign_key "badges_chefs", "chefs"
  add_foreign_key "chefs", "chef_types"
  add_foreign_key "chefs", "countries"
  add_foreign_key "permissions", "entities"
  add_foreign_key "plates", "chefs"
  add_foreign_key "plates", "nutritional_tables"
  add_foreign_key "plates", "plate_types"
  add_foreign_key "users", "roles"
end
