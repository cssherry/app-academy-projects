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

ActiveRecord::Schema.define(version: 20150108013803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: true do |t|
    t.integer  "cat_id",     null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.text     "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id", using: :btree
  add_index "cat_rental_requests", ["user_id"], name: "index_cat_rental_requests_on_user_id", using: :btree

  create_table "cats", force: true do |t|
    t.date     "birth_date"
    t.string   "color"
    t.string   "name"
    t.string   "sex",         limit: 1
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id",               null: false
  end

  add_index "cats", ["user_id"], name: "index_cats_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "username",        null: false
    t.text     "password_digest", null: false
    t.text     "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
