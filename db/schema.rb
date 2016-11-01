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

ActiveRecord::Schema.define(version: 20161101071536) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_comments_on_meetup_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "address"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "comments_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_meetups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "confirm_token"
    t.string   "auth_token"
    t.datetime "confirmed_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["confirm_token"], name: "index_users_on_confirm_token", unique: true
  end

end
