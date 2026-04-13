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

ActiveRecord::Schema[8.1].define(version: 2026_04_13_133812) do
  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration_minutes"
    t.string "poster_url"
    t.date "release_date"
    t.text "synopsis"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.text "bio"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "movie_id", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "character_name"
    t.datetime "created_at", null: false
    t.integer "movie_id", null: false
    t.integer "person_id", null: false
    t.string "role_type"
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_roles_on_movie_id"
    t.index ["person_id"], name: "index_roles_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "movie_genres", "genres"
  add_foreign_key "movie_genres", "movies"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "roles", "movies"
  add_foreign_key "roles", "people"
end
