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

ActiveRecord::Schema.define(version: 20150125201421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliases", force: :cascade do |t|
    t.integer "legislator_id", null: false
    t.string  "alias1"
    t.string  "alias2"
    t.string  "alias3"
    t.string  "alias4"
    t.string  "alias5"
    t.string  "alias6"
  end

  create_table "bill_votes", force: :cascade do |t|
    t.integer "bill_id",       null: false
    t.integer "legislator_id", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "official_title", null: false
    t.string "popular_title"
    t.string "short_title"
    t.string "summary"
    t.string "summary_short"
    t.string "congress_url"
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stance_id"
    t.integer  "legislator_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: :cascade do |t|
    t.text "description", null: false
  end

  create_table "legislator_stances", force: :cascade do |t|
    t.integer "legislator_id", null: false
    t.integer "stance_id",     null: false
  end

  create_table "legislators", force: :cascade do |t|
    t.string "bioguide_id",          null: false
    t.string "first_name",           null: false
    t.string "last_name",            null: false
    t.string "middle_name"
    t.string "nickname"
    t.string "name_suffix"
    t.string "party"
    t.string "phone"
    t.string "website"
    t.string "office"
    t.string "contact_form"
    t.string "fax"
    t.string "twitter_id"
    t.string "campaign_twitter_ids"
    t.string "youtube_id"
    t.string "facebook_id"
    t.string "district"
    t.string "img_url"
  end

  create_table "positions", force: :cascade do |t|
    t.integer "issue_id",    null: false
    t.text    "description", null: false
  end

  create_table "stances", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "position_id", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.integer "legislator_id", null: false
    t.string  "start_date"
    t.string  "end_date"
    t.string  "state"
    t.string  "party"
    t.string  "senate_class"
    t.string  "title"
    t.string  "chamber"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "stance_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "middle_name",     default: ""
    t.string   "username",                        null: false
    t.string   "city"
    t.text     "about"
    t.string   "password_digest",                 null: false
    t.string   "email",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
    t.boolean  "is_deleted",      default: false
    t.string   "state"
  end

end
