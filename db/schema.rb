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

ActiveRecord::Schema.define(version: 20141215061339) do

  create_table "microposts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "category"
    t.text     "short_desc"
    t.text     "desc"
    t.text     "rep_short_desc"
    t.text     "rep_desc"
    t.integer  "goods_seq"
    t.string   "maker"
    t.string   "pic_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["goods_seq"], name: "index_microposts_on_goods_seq"
  add_index "microposts", ["maker", "goods_seq"], name: "index_microposts_on_maker_and_goods_seq"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "rep_id"
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["rep_id"], name: "index_users_on_rep_id", unique: true

end
