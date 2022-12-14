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

ActiveRecord::Schema[7.0].define(version: 2022_11_14_175019) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.string "location"
    t.string "weather"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "fish", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "user_id"
    t.string "species"
    t.integer "length"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knots", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lures", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "user_id"
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ramps", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "length"
    t.string "weight"
    t.string "habits"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
