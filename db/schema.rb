# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_14_073521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "guilds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "in_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ally_code"
    t.string "name"
    t.integer "guild_id"
  end

  create_table "roster_units", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "in_game_id"
    t.integer "player_id"
    t.integer "relic_level"
    t.integer "gear_level"
    t.integer "rarity_level"
    t.index ["player_id", "in_game_id"], name: "index_roster_units_on_player_id_and_in_game_id", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "in_game_id"
    t.string "type"
    t.index ["in_game_id"], name: "index_units_on_in_game_id", unique: true
  end
end
