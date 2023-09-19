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

ActiveRecord::Schema[7.0].define(version: 2023_09_19_201104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "tweets_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweets_id"], name: "index_bookmarks_on_tweets_id"
    t.index ["users_id"], name: "index_bookmarks_on_users_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follow_id"
    t.integer "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "tweets_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "users_id"
    t.integer "other_tweet_id"
    t.string "type"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password", comment: "The data type of this column will be changed on validations."
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "tweets", column: "tweets_id"
  add_foreign_key "bookmarks", "users", column: "users_id"
  add_foreign_key "followers", "users", column: "follow_id"
  add_foreign_key "followers", "users", column: "follower_id"
  add_foreign_key "likes", "tweets", column: "tweets_id"
  add_foreign_key "likes", "users", column: "users_id"
  add_foreign_key "tweets", "users", column: "users_id"
end
