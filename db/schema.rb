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

ActiveRecord::Schema[7.0].define(version: 2024_06_03_143653) do
  create_table "music_records", force: :cascade do |t|
    t.string "title", null: false
    t.string "photo", null: false
    t.integer "price", null: false
    t.string "currency", null: false
    t.text "description", null: false
    t.integer "damage_assessment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "music_record_id", null: false
    t.string "note"
    t.integer "initial_price", null: false
    t.integer "initial_damage_assessment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_record_id"], name: "index_orders_on_music_record_id"
    t.index ["user_id", "music_record_id"], name: "index_orders_on_user_id_and_music_record_id", unique: true
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "orders", "music_records"
  add_foreign_key "orders", "users"
end
