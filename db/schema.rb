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

ActiveRecord::Schema.define(version: 20160531084029) do

  create_table "enquiries", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profile_subjects", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_subjects", ["profile_id"], name: "index_profile_subjects_on_profile_id"
  add_index "profile_subjects", ["subject_id"], name: "index_profile_subjects_on_subject_id"

  create_table "profile_year_levels", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "year_level_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profile_year_levels", ["profile_id"], name: "index_profile_year_levels_on_profile_id"
  add_index "profile_year_levels", ["year_level_id"], name: "index_profile_year_levels_on_year_level_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "qualification"
    t.integer  "years_experience"
    t.decimal  "hourly_rate"
    t.string   "picture"
    t.text     "bio"
    t.string   "street"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "year_levels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
