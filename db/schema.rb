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

ActiveRecord::Schema[7.0].define(version: 2023_12_06_211248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
  end

  create_table "groups_mentors", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "mentor_id", null: false
    t.index ["group_id", "mentor_id"], name: "index_groups_mentors_on_group_id_and_mentor_id"
    t.index ["mentor_id", "group_id"], name: "index_groups_mentors_on_mentor_id_and_group_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "surname", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.integer "groups", default: [], array: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["reset_password_token"], name: "index_mentors_on_reset_password_token", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.bigint "group_id"
    t.string "surname", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "remember_digest"
    t.integer "study_group"
    t.string "reset_password_token"
    t.datetime "remember_created_at"
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

end
