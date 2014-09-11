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

ActiveRecord::Schema.define(version: 20140911213819) do

  create_table "anaprtments", force: true do |t|
    t.string   "district_number"
    t.string   "numberpp"
    t.string   "location"
    t.string   "source"
    t.decimal  "area"
    t.decimal  "number_rooms"
    t.decimal  "cost_analogue_usd"
    t.integer  "floor"
    t.integer  "storeys"
    t.string   "building_type"
    t.string   "category_repair"
    t.decimal  "cost_one"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anearts", force: true do |t|
    t.string   "district_number"
    t.string   "analogs_address"
    t.decimal  "area"
    t.string   "purpose"
    t.decimal  "value_proposition_usd"
    t.string   "information_source"
    t.decimal  "value_proposition_usdone"
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
    t.string   "number"
    t.string   "housing"
    t.string   "room_apartment"
    t.decimal  "total_area"
    t.decimal  "floor_area"
    t.decimal  "area_land"
    t.string   "district_number"
    t.string   "category_repair"
    t.decimal  "uah_market_value"
    t.decimal  "usd_market_value"
    t.decimal  "euro_market_value"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "district_number"
    t.string   "category_repair"
    t.decimal  "uah_market_value"
    t.decimal  "usd_market_value"
    t.decimal  "euro_market_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.string   "col_1_s"
    t.integer  "col_2_i"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "col_3_ru"
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
