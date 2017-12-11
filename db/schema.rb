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

ActiveRecord::Schema.define(version: 20171211103619) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "site_url"
    t.string   "logo_url"
    t.text     "describe"
    t.integer  "company_field_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "companies", ["company_field_id"], name: "index_companies_on_company_field_id"

  create_table "company_fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edu_paths", force: :cascade do |t|
    t.integer  "stack_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "edu_paths", ["stack_id"], name: "index_edu_paths_on_stack_id"

  create_table "gittrends", force: :cascade do |t|
    t.string   "name"
    t.string   "year"
    t.string   "quarter"
    t.string   "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "inter_stacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inter_stacks", ["stack_id"], name: "index_inter_stacks_on_stack_id"
  add_index "inter_stacks", ["user_id"], name: "index_inter_stacks_on_user_id"

  create_table "my_stacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_stacks", ["stack_id"], name: "index_my_stacks_on_stack_id"
  add_index "my_stacks", ["user_id"], name: "index_my_stacks_on_user_id"

  create_table "octo_trends", force: :cascade do |t|
    t.string   "table_id"
    t.string   "table_title"
    t.string   "content_name"
    t.string   "content_figure"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "service_stacks", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "stack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_stacks", ["service_id"], name: "index_service_stacks_on_service_id"
  add_index "service_stacks", ["stack_id"], name: "index_service_stacks_on_stack_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "site_url"
    t.string   "logo_url"
    t.text     "describe"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "services", ["company_id"], name: "index_services_on_company_id"

  create_table "stack_fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stack_trends", force: :cascade do |t|
    t.string   "type_id"
    t.string   "type_name"
    t.string   "stack_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stacks", force: :cascade do |t|
    t.string   "name"
    t.string   "site_url"
    t.string   "short_describe"
    t.text     "describe"
    t.string   "version"
    t.integer  "stack_field_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "stacks", ["stack_field_id"], name: "index_stacks_on_stack_field_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "phone"
    t.string   "nickname"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
