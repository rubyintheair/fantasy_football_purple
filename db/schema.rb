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

ActiveRecord::Schema.define(version: 20171204132238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_items", force: :cascade do |t|
    t.string "name"
    t.text "guidance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question"
  end

  create_table "games", force: :cascade do |t|
    t.integer "owner_team_id"
    t.integer "guest_team_id"
    t.integer "game_item_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "owner_score"
    t.float "guest_score"
    t.integer "match_id"
    t.string "answer"
  end

  create_table "line_results", force: :cascade do |t|
    t.integer "game_item_id"
    t.integer "game_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "line_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_team_id"
    t.integer "guest_team_id"
    t.integer "user_id"
  end

  create_table "team_plays", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teammate_id"
    t.string "name"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_type"
    t.integer "team_display_id"
    t.string "user_id"
    t.string "integer"
    t.integer "teamplay_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

end
