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

ActiveRecord::Schema.define(version: 20151209132459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cart_membership_statuses", force: :cascade do |t|
    t.boolean  "is_a_member", default: false, null: false
    t.integer  "cart_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "cart_membership_statuses", ["cart_id"], name: "index_cart_membership_statuses_on_cart_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "purchased_at"
    t.string   "email"
    t.string   "card_token"
    t.string   "buyer_name"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "street_address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.string   "first_speaker"
    t.string   "second_speaker"
    t.text     "synopsis"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "mailing_lists", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "member_last_name"
    t.string   "member_first_name"
    t.string   "degree"
    t.string   "mailing_address_street"
    t.string   "mailing_address_city"
    t.string   "mailing_address_state"
    t.integer  "mailing_address_zip"
    t.string   "office_address_street"
    t.string   "office_address_city"
    t.string   "office_address_state"
    t.integer  "office_address_zip"
    t.string   "email"
    t.string   "office_phone"
    t.string   "fax"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.date     "birth_date"
    t.text     "practice_specialities"
    t.boolean  "publish",                default: false, null: false
    t.boolean  "new_patients",           default: false, null: false
    t.string   "membership_type"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "liscense"
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "card_token"
    t.string   "email"
    t.datetime "purchased_at"
    t.integer  "member_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "memberships", ["member_id"], name: "index_memberships_on_member_id", using: :btree

  create_table "other_events", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.string   "street_address"
    t.string   "city"
    t.integer  "zipcode"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "speaking_event_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sale_items", ["cart_id"], name: "index_sale_items_on_cart_id", using: :btree
  add_index "sale_items", ["speaking_event_id"], name: "index_sale_items_on_speaking_event_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.text     "biography"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.date     "date"
    t.string   "description"
  end

  create_table "speaking_events", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.string   "street_address"
    t.string   "city"
    t.integer  "zipcode"
    t.text     "description"
    t.decimal  "regular_price"
    t.decimal  "member_price"
    t.integer  "speaker_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "speaking_events", ["speaker_id"], name: "index_speaking_events_on_speaker_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cart_membership_statuses", "carts"
  add_foreign_key "memberships", "members"
  add_foreign_key "sale_items", "carts"
  add_foreign_key "sale_items", "speaking_events"
  add_foreign_key "speaking_events", "speakers"
end
