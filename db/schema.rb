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

ActiveRecord::Schema.define(version: 2022_05_07_070436) do

  create_table "bets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "circuit"
    t.integer "year"
    t.string "pole_position"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "result_points"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "formula_one_drivers", force: :cascade do |t|
    t.string "Name"
    t.string "Country"
    t.string "Team"
    t.integer "Number"
    t.integer "Position"
    t.integer "points"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_img"
    t.string "number_img"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bets", "users"
end
