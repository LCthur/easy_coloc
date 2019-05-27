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

ActiveRecord::Schema.define(version: 2019_05_27_141757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.date "deadline"
    t.boolean "done_state"
    t.bigint "roommate_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roommate_id"], name: "index_assignments_on_roommate_id"
    t.index ["task_id"], name: "index_assignments_on_task_id"
  end

  create_table "deals", force: :cascade do |t|
    t.boolean "chosen"
    t.string "description"
    t.bigint "assignment_id"
    t.integer "assignment_proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_deals_on_assignment_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.boolean "task_management"
    t.boolean "event_management"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string "description"
    t.string "photo_url"
    t.bigint "assignment_id"
    t.bigint "roommate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_issues_on_assignment_id"
    t.index ["roommate_id"], name: "index_issues_on_roommate_id"
  end

  create_table "roommates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url"
    t.string "email"
    t.boolean "admin"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_roommates_on_flat_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "assignments", "roommates"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "deals", "assignments"
  add_foreign_key "issues", "assignments"
  add_foreign_key "issues", "roommates"
  add_foreign_key "roommates", "flats"
end
