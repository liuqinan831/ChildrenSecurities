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

ActiveRecord::Schema.define(version: 20130925100237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree

  create_table "blog_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "blogs", force: true do |t|
    t.string   "title",                       null: false
    t.string   "slug_url"
    t.integer  "view_count",      default: 0, null: false
    t.integer  "blog_content_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["blog_content_id"], name: "index_blogs_on_blog_content_id", using: :btree

end
