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

ActiveRecord::Schema.define(version: 20141001074838) do

  create_table "anaprtments", force: true do |t|
    t.integer  "district_number"
    t.integer  "numberpp"
    t.string   "location"
    t.text     "source",            limit: 255
    t.decimal  "area"
    t.integer  "number_rooms"
    t.decimal  "cost_analogue_usd"
    t.integer  "floor"
    t.integer  "storeys"
    t.integer  "building_type"
    t.string   "category_repair"
    t.decimal  "cost_one"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anearts", force: true do |t|
    t.integer  "district_number"
    t.string   "analogs_address"
    t.decimal  "area"
    t.string   "purpose"
    t.decimal  "value_proposition_usd"
    t.string   "information_source"
    t.decimal  "value_proposition_usdone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anhouseholds", force: true do |t|
    t.integer  "number_district"
    t.string   "danalog"
    t.decimal  "darea_building"
    t.decimal  "darea_land"
    t.decimal  "dvalue_proposition_usd"
    t.decimal  "dvalue_proposition_usd_no_land"
    t.decimal  "dvalue_proposition_usd_kvm"
    t.string   "dcategory_repair"
    t.string   "dsource_information"
    t.string   "zanalog"
    t.decimal  "zarea"
    t.string   "zpurpose"
    t.decimal  "zvalue_proposition_usd"
    t.string   "zsource_information"
    t.decimal  "zvalue_proposition_usd_kvm"
    t.integer  "mediana"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apartments", force: true do |t|
    t.string   "code_provision"
    t.string   "new_code"
    t.string   "account_number"
    t.string   "alt_account_number"
    t.string   "tip"
    t.string   "region"
    t.string   "district"
    t.string   "type_settlement"
    t.string   "city"
    t.string   "street_type"
    t.string   "street_name"
    t.string   "number_house"
    t.string   "number_house2"
    t.string   "room_apartment"
    t.decimal  "area"
    t.decimal  "floor_area"
    t.integer  "number_rooms"
    t.integer  "storey"
    t.integer  "floors"
    t.integer  "series_home"
    t.integer  "district_number"
    t.decimal  "uah_market_value"
    t.decimal  "usd_market_value"
    t.decimal  "euro_market_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "median"
  end

  create_table "auctions", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "capartments", force: true do |t|
    t.integer  "auction"
    t.integer  "tip_house"
    t.integer  "value_repair"
    t.integer  "storey"
    t.integer  "rooms"
    t.decimal  "adj_cost_value"
    t.integer  "apartment_id"
    t.integer  "anaprtment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cearths", force: true do |t|
    t.integer  "auction"
    t.integer  "location"
    t.integer  "infrastructure"
    t.integer  "diff_area"
    t.decimal  "adj_cost_value"
    t.integer  "earth_id"
    t.integer  "aneart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repair"
  end

  create_table "chouses", force: true do |t|
    t.integer  "auction"
    t.integer  "location"
    t.integer  "infrastructure"
    t.integer  "diff_area"
    t.integer  "category_repair"
    t.decimal  "adj_cost_value"
    t.integer  "house_id"
    t.integer  "anhousehold_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.decimal  "value"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earths", force: true do |t|
    t.string   "code_provision"
    t.string   "tip"
    t.string   "region"
    t.string   "district"
    t.string   "city"
    t.string   "street_type"
    t.string   "street_name"
    t.string   "street_name2"
    t.string   "number_home"
    t.string   "number_housing"
    t.string   "room_apartment"
    t.decimal  "total_area"
    t.decimal  "floor_area"
    t.decimal  "area_land"
    t.integer  "district_number"
    t.string   "category_repair"
    t.decimal  "uah_market_value"
    t.decimal  "usd_market_value"
    t.decimal  "euro_market_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "median"
  end

  create_table "houses", force: true do |t|
    t.string   "code_provision"
    t.string   "tip"
    t.string   "region"
    t.string   "district"
    t.string   "city"
    t.string   "street_type"
    t.string   "street_name"
    t.string   "street_name2"
    t.string   "number_home"
    t.string   "number_housing"
    t.string   "room_apartment"
    t.decimal  "total_area"
    t.decimal  "floor_area"
    t.decimal  "area_land"
    t.integer  "district_number"
    t.string   "category_repair"
    t.decimal  "uah_market_value"
    t.decimal  "usd_market_value"
    t.decimal  "euro_market_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "median"
  end

  create_table "kolrooms", force: true do |t|
    t.integer  "num_analog"
    t.integer  "o1"
    t.integer  "o2"
    t.integer  "o3"
    t.integer  "o4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repairs", force: true do |t|
    t.integer  "high"
    t.integer  "eurorepair"
    t.integer  "advanced"
    t.integer  "simple"
    t.integer  "nodecoration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: true do |t|
    t.string   "torg_apartment"
    t.string   "torg_earth"
    t.string   "torg_house"
    t.string   "floor_apartment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location"
    t.integer  "infrastructure"
    t.integer  "location_house"
    t.integer  "infrastructura_house"
  end

  create_table "tiphouses", force: true do |t|
    t.integer  "num_analog"
    t.integer  "o1"
    t.integer  "o2"
    t.integer  "o3"
    t.integer  "o4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "verification"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
