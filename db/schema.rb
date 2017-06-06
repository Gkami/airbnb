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

ActiveRecord::Schema.define(version: 20170602065605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "num_guests"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "total_price"
    t.index ["listing_id"], name: "index_bookings_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address1"
    t.string   "address2"
    t.integer  "postal_code"
    t.string   "state"
    t.string   "country"
    t.integer  "price"
    t.string   "room_type"
    t.string   "description"
    t.date     "availability"
    t.integer  "bedroom"
    t.integer  "bathroom"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.json     "photos"
    t.integer  "max_num_guests"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "no_guest"
    t.string   "comment"
    t.integer  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "listing_id"
    t.boolean  "is_tv"
    t.boolean  "is_kitchen"
    t.boolean  "is_air"
    t.boolean  "is_internet"
    t.boolean  "is_smoker"
    t.boolean  "is_non_smoker"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["listing_id"], name: "index_tags_on_listing_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_no"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.date     "birthday"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
    t.integer  "access_level",                   default: 0
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
  add_foreign_key "tags", "listings"
end
