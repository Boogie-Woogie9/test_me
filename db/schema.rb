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

ActiveRecord::Schema[7.0].define(version: 2023_12_08_165129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
  end

  create_table "groups_mentors", id: false, force: :cascade do |t|
    t.bigint "mentor_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_groups_mentors_on_group_id"
    t.index ["mentor_id"], name: "index_groups_mentors_on_mentor_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "surname", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_mentors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mentors_on_reset_password_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.text "content"
    t.string "answer1"
    t.string "answer2"
    t.string "answer3"
    t.string "answer4"
    t.integer "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quiz_submissions", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "quiz_id", null: false
    t.float "score"
    t.json "student_answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_submissions_on_quiz_id"
    t.index ["student_id"], name: "index_quiz_submissions_on_student_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.bigint "mentor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_quizzes_on_mentor_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "group_id"
    t.string "surname", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "quizzes"
  add_foreign_key "quiz_submissions", "quizzes"
  add_foreign_key "quiz_submissions", "students"
  add_foreign_key "quizzes", "mentors"
end
