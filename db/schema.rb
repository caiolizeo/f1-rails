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

ActiveRecord::Schema[7.0].define(version: 2022_06_24_120938) do
  create_table "bets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "circuit"
    t.integer "year"
    t.string "pole"
    t.string "first"
    t.string "second"
    t.string "third"
    t.string "fourth"
    t.string "fifth"
    t.string "sixth"
    t.string "seventh"
    t.string "eighth"
    t.string "ninth"
    t.string "tenth"
    t.integer "result_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "validated", default: false, null: false
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "f1_circuits", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "country"
    t.string "latitude"
    t.string "longitude"
    t.string "local"
    t.integer "round"
    t.datetime "fp1"
    t.datetime "fp2"
    t.datetime "fp3"
    t.datetime "qualifying"
    t.datetime "sprint"
    t.datetime "race"
    t.integer "year"
    t.string "photo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f1_drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "code"
    t.string "country"
    t.string "team"
    t.string "number"
    t.string "year"
    t.string "photo_img"
    t.string "logo_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "points"
    t.integer "wins"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bets", "users"
end
