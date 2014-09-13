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

ActiveRecord::Schema.define(version: 20140912212804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "aticels", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.date     "published_on"
    t.string   "tags",         array: true
    t.hstore   "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_plots", force: true do |t|
    t.integer  "game_id",        null: false
    t.integer  "vertical"
    t.integer  "horizontal"
    t.integer  "selected_by_id"
    t.integer  "selected_turn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "started_by_id"
    t.integer  "winner_id"
    t.integer  "losser_id"
    t.integer  "first_player_id"
    t.integer  "secound_player_id"
    t.integer  "turn",              default: 1
    t.integer  "rows",                          null: false
    t.integer  "columns",                       null: false
    t.string   "mode"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length_to_win"
  end

  create_table "users", force: true do |t|
    t.string   "username",        limit: 26
    t.string   "epost",           limit: 100, default: "", null: false
    t.string   "password_digest"
    t.string   "user_photo"
    t.integer  "default_brick"
    t.date     "first_login"
    t.date     "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
