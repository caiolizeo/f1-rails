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

ActiveRecord::Schema.define(version: 2022_05_24_202217) do

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
    t.boolean "validated", default: false, null: false
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "formula_one_circuits", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.date "date"
    t.string "code"
    t.string "latitude"
    t.string "longitude"
    t.string "local"
    t.integer "round"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_path"
    t.datetime "fp1"
    t.datetime "fp2"
    t.datetime "fp3"
    t.datetime "qualifying"
    t.datetime "sprint"
  end

  create_table "formula_one_drivers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "team"
    t.integer "number"
    t.integer "year"
    t.string "photo_img"
    t.string "logo_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.string "last_name"
    t.string "full_name"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'has_many' for column 'bet'

  add_foreign_key "bets", "users"
end
