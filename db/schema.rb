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

ActiveRecord::Schema.define(version: 20131023041812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "boards", force: true do |t|
    t.integer  "user_id"
    t.integer  "kind"
    t.string   "subject"
    t.text     "body"
    t.string   "prefecture"
    t.string   "city"
    t.string   "town"
    t.integer  "sex"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.text     "note"
    t.string   "prefecture"
    t.string   "city"
    t.string   "town"
    t.integer  "facility",            limit: 8
    t.integer  "from_station"
    t.integer  "near_station_cd"
    t.integer  "kind",                limit: 2
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.integer  "to_userid"
    t.integer  "from_userid"
    t.string   "subject"
    t.text     "body"
    t.datetime "received_time"
    t.datetime "deleted_time_by_sender"
    t.datetime "deleted_time_by_recipient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", id: false, force: true do |t|
    t.integer  "id",         null: false
    t.integer  "company_id"
    t.text     "name"
    t.integer  "status"
    t.integer  "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lines", ["company_id"], name: "lines_company_id_idx", using: :btree

  create_table "rail_companies", id: false, force: true do |t|
    t.integer  "id",                       null: false
    t.integer  "rr_id"
    t.string   "name",         limit: 160
    t.string   "url",          limit: 160
    t.integer  "company_type"
    t.integer  "status",       limit: 2
    t.integer  "sort",         limit: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rooms", force: true do |t|
    t.integer  "house_id"
    t.string   "name"
    t.string   "largeness"
    t.integer  "kind",                limit: 2
    t.integer  "facilities"
    t.integer  "sex",                 limit: 2
    t.integer  "rent"
    t.integer  "expense"
    t.text     "note"
    t.boolean  "enable"
    t.integer  "nationality",         limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.integer  "deposit"
  end

  add_index "rooms", ["house_id"], name: "rooms_house_id_idx", using: :btree

# Could not dump table "shop" because of following StandardError
#   Unknown type 'geometry' for column 'map_point'

  create_table "spatial_ref_sys", id: false, force: true do |t|
    t.integer "srid",                   null: false
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "stations", id: false, force: true do |t|
    t.integer  "id",                      null: false
    t.integer  "group_id"
    t.string   "name",        limit: 160
    t.integer  "line_id"
    t.integer  "pref_cd"
    t.string   "zipcode",     limit: 10
    t.string   "address",     limit: 600
    t.decimal  "lon"
    t.decimal  "lat"
    t.integer  "display_flg", limit: 2
    t.integer  "sort"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "stations", ["line_id"], name: "stations_line_id_idx", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

end
