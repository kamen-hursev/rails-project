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

ActiveRecord::Schema.define(version: 20140503171255) do

  create_table "brokers", force: true do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brokers_companies", force: true do |t|
    t.integer "broker_id",  null: false
    t.integer "company_id", null: false
  end

  create_table "companies", force: true do |t|
    t.string   "name",                  null: false
    t.string   "address"
    t.string   "identification_number"
    t.string   "email"
    t.boolean  "listed_on_exchange"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.integer  "company_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name",       null: false
    t.integer  "company_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
