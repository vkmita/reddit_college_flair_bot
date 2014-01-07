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

ActiveRecord::Schema.define(version: 20140107075059) do

  create_table "subreddits", force: true do |t|
    t.integer  "moderator_id"
    t.string   "name",         limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subreddits", ["moderator_id"], name: "index_subreddits_on_moderator_id"

  create_table "users", force: true do |t|
    t.string   "username",      limit: 20
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
