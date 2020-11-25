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

ActiveRecord::Schema.define(version: 2020_11_24_091030) do

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "task_1", null: false
    t.text "detalis_1"
    t.integer "start_time_1_id", null: false
    t.integer "end_time_1_id", null: false
    t.integer "start_minutes_1_id", null: false
    t.integer "end_minutes_1_id", null: false
    t.string "task_2"
    t.text "detalis_2"
    t.integer "start_time_2_id"
    t.integer "end_time_2_id"
    t.integer "start_minutes_2_id"
    t.integer "end_minutes_2_id"
    t.string "task_3"
    t.text "detalis_3"
    t.integer "start_time_3_id"
    t.integer "end_time_3_id"
    t.integer "start_minutes_3_id"
    t.integer "end_minutes_3_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
