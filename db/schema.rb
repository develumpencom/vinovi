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

ActiveRecord::Schema[8.0].define(version: 2025_03_16_170044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "tmdb_id", null: false
    t.string "imdb_id"
    t.string "title", null: false
    t.string "release_year"
    t.integer "runtime"
    t.string "poster_path"
    t.string "overview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_episodes", force: :cascade do |t|
    t.string "tmdb_id", null: false
    t.bigint "tv_serie_id", null: false
    t.bigint "tv_season_id", null: false
    t.string "name"
    t.string "still_path"
    t.integer "episode_number"
    t.string "air_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_season_id"], name: "index_tv_episodes_on_tv_season_id"
    t.index ["tv_serie_id"], name: "index_tv_episodes_on_tv_serie_id"
  end

  create_table "tv_seasons", force: :cascade do |t|
    t.string "tmdb_id", null: false
    t.bigint "tv_serie_id", null: false
    t.string "poster_path"
    t.integer "season_number"
    t.string "air_date"
    t.integer "episode_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_serie_id"], name: "index_tv_seasons_on_tv_serie_id"
  end

  create_table "tv_series", force: :cascade do |t|
    t.string "tmdb_id", null: false
    t.string "name", null: false
    t.text "overview"
    t.string "poster_path"
    t.string "first_air_date"
    t.integer "number_of_seasons", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "breakable_toys_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "users_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_sessions_on_user_id"
  end

  create_table "watched", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "media_type", null: false
    t.bigint "media_id", null: false
    t.datetime "watched_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type", "media_id"], name: "index_watched_on_media"
    t.index ["user_id"], name: "index_watched_on_user_id"
  end

  add_foreign_key "lists", "users"
  add_foreign_key "tv_episodes", "tv_seasons"
  add_foreign_key "tv_episodes", "tv_series", column: "tv_serie_id"
  add_foreign_key "tv_seasons", "tv_series", column: "tv_serie_id"
  add_foreign_key "users_sessions", "users"
  add_foreign_key "watched", "users"
end
