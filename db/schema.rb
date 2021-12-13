# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_13_062328) do

  create_table "customer_requests", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "flower_type_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_type_id"], name: "index_customer_requests_on_flower_type_id"
    t.index ["user_profile_id"], name: "index_customer_requests_on_user_profile_id"
  end

  create_table "flower_types", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "growth_duration_seconds"
    t.integer "buy_price"
    t.integer "sell_price"
    t.integer "max_water_interval"
    t.integer "harvest_duration_seconds"
    t.string "graphic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owned_flowers", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "flower_type_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_type_id"], name: "index_owned_flowers_on_flower_type_id"
    t.index ["user_profile_id"], name: "index_owned_flowers_on_user_profile_id"
  end

  create_table "owned_seeds", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "flower_type_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_type_id"], name: "index_owned_seeds_on_flower_type_id"
    t.index ["user_profile_id"], name: "index_owned_seeds_on_user_profile_id"
  end

  create_table "plot_slots", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "x"
    t.integer "y"
    t.integer "flower_type_id", null: false
    t.datetime "when_planted"
    t.datetime "when_watered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_type_id"], name: "index_plot_slots_on_flower_type_id"
    t.index ["user_profile_id"], name: "index_plot_slots_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "user_name"
    t.integer "sun_penny"
    t.datetime "last_update"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "plot_size"
  end

  add_foreign_key "customer_requests", "flower_types"
  add_foreign_key "customer_requests", "user_profiles"
  add_foreign_key "owned_flowers", "flower_types"
  add_foreign_key "owned_flowers", "user_profiles"
  add_foreign_key "owned_seeds", "flower_types"
  add_foreign_key "owned_seeds", "user_profiles"
  add_foreign_key "plot_slots", "flower_types"
  add_foreign_key "plot_slots", "user_profiles"
end
