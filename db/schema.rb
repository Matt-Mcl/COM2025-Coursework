# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_110009) do

  create_table "carparks", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_carparks_on_name", unique: true
  end

  create_table "spaces", force: :cascade do |t|
    t.integer "carpark_id", null: false
    t.integer "space_number", null: false
    t.decimal "hourly_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carpark_id"], name: "index_spaces_on_carpark_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "space_id", null: false
    t.string "registration_number", null: false
    t.datetime "paid_from", null: false
    t.datetime "paid_to", null: false
    t.decimal "total_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_tickets_on_space_id"
  end

end
