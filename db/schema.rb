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

ActiveRecord::Schema[7.2].define(version: 2025_04_29_195830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "mood"
    t.string "purr_style"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_wisdoms", force: :cascade do |t|
    t.text "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cat_id", null: false
    t.integer "duration_seconds"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_sessions_on_cat_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "user_cats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cat_id", null: false
    t.integer "times_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_user_cats_on_cat_id"
    t.index ["user_id"], name: "index_user_cats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sessions", "cats"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_cats", "cats"
  add_foreign_key "user_cats", "users"
end
