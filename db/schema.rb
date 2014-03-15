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

ActiveRecord::Schema.define(version: 20140315140243) do

  create_table "players", force: true do |t|
    t.string   "name"
    t.decimal  "positive_percentage", precision: 10, scale: 0
    t.integer  "squad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "squads", force: true do |t|
    t.string   "name"
    t.decimal  "positive_percentage", precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
  end

  create_table "tweets", force: true do |t|
    t.string   "text"
    t.boolean  "positive"
    t.integer  "tweetable_id"
    t.string   "tweetable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

end
