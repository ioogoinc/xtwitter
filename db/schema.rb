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

ActiveRecord::Schema[7.0].define(version: 2023_09_19_160554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "tweets_id"
    t.datetime "created_at", precision: nil
    t.index ["tweets_id"], name: "index_bookmarks_on_tweets_id"
    t.index ["users_id"], name: "index_bookmarks_on_users_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_user_id"
    t.bigint "following_user_id"
    t.datetime "created_at", precision: nil
    t.index ["follower_user_id"], name: "index_followers_on_follower_user_id"
    t.index ["following_user_id"], name: "index_followers_on_following_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "tweets_id"
    t.datetime "created_at", precision: nil
    t.index ["tweets_id"], name: "index_likes_on_tweets_id"
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "users_id"
    t.text "body"
    t.boolean "retweet"
    t.boolean "quotes"
    t.datetime "created_at", precision: nil
    t.index ["users_id"], name: "index_tweets_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "followers", "users", column: "follower_user_id"
  add_foreign_key "followers", "users", column: "following_user_id"
end
