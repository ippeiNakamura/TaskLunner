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

ActiveRecord::Schema.define(version: 2021_12_05_000515) do

  create_table "flags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "output_id"
    t.string "name"
    t.date "targetDay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["output_id"], name: "index_flags_on_output_id"
  end

  create_table "outputs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.time "releaseDay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_outputs_on_project_id"
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "flag_id"
    t.string "name"
    t.string "status"
    t.float "assumptionCost"
    t.float "actuallyCost"
    t.string "memo"
    t.date "targetDay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.integer "children_count"
    t.string "assumptionCostTimeFomrat"
    t.index ["depth"], name: "index_tasks_on_depth"
    t.index ["flag_id"], name: "index_tasks_on_flag_id"
    t.index ["lft"], name: "index_tasks_on_lft"
    t.index ["parent_id"], name: "index_tasks_on_parent_id"
    t.index ["rgt"], name: "index_tasks_on_rgt"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "releaseDate"
  end

  add_foreign_key "flags", "outputs"
  add_foreign_key "outputs", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "flags"
end
