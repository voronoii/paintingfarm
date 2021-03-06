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

ActiveRecord::Schema.define(version: 20161023152708) do

  create_table "artists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string   "writer"
    t.integer  "writer_id"
    t.string   "pwd"
    t.string   "title"
    t.text     "content"
    t.integer  "views",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "p_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "pwd"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.integer  "price"
    t.integer  "genre_id"
    t.integer  "year"
    t.string   "material"
    t.text     "content"
    t.integer  "like",       default: 0
    t.integer  "view",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "writer"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "views",      default: 0
  end

  create_table "post_images", force: :cascade do |t|
    t.text     "image_url",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "artistid"
    t.text     "academic"
    t.text     "awards"
    t.text     "privateexhibitions"
    t.text     "teamexhibitions"
    t.text     "artfairs"
    t.text     "possessions"
    t.text     "etc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname",               default: "", null: false
    t.string   "position",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "room"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true
  add_index "users", ["position"], name: "index_users_on_position"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
