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

ActiveRecord::Schema.define(version: 20170510012559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "valid_until", null: false
    t.integer  "unity_id",    null: false
    t.integer  "service_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["service_id"], name: "index_orders_on_service_id", using: :btree
    t.index ["unity_id"], name: "index_orders_on_unity_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "periodicity", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "unities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "client_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_unities_on_client_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "client_id",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["client_id"], name: "index_users_on_client_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "orders", "services"
  add_foreign_key "orders", "unities"
  add_foreign_key "unities", "clients"
  add_foreign_key "users", "clients"
end
