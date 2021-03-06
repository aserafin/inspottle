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

ActiveRecord::Schema.define(version: 20140919130028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                default: 1, null: false
    t.string   "icon_white_file_name"
    t.string   "icon_white_content_type"
    t.integer  "icon_white_file_size"
    t.datetime "icon_white_updated_at"
    t.string   "icon_blue_file_name"
    t.string   "icon_blue_content_type"
    t.integer  "icon_blue_file_size"
    t.datetime "icon_blue_updated_at"
  end

  add_index "activities", ["name"], name: "index_activities_on_name", unique: true, using: :btree

  create_table "event_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.integer  "activity_id"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spot_activities", force: true do |t|
    t.integer  "spot_id",     null: false
    t.integer  "activity_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", force: true do |t|
    t.string   "name",              null: false
    t.decimal  "latitude",          null: false
    t.decimal  "longitude",         null: false
    t.text     "short_description"
    t.string   "address1"
    t.string   "address2"
    t.string   "post_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  add_index "spots", ["creator_id"], name: "index_spots_on_creator_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",           null: false
    t.string   "email",          null: false
    t.string   "facebook_id",    null: false
    t.text     "facebook_token", null: false
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id", unique: true, using: :btree

end
