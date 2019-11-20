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

ActiveRecord::Schema.define(version: 2019_11_07_005607) do

  create_table "applis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "place"
    t.string "content"
    t.string "company_name"
    t.integer "withdrawal", limit: 1
    t.datetime "withdrawal_day"
    t.integer "admit_flg"
    t.integer "watch_flg"
    t.text "comment"
    t.text "reply"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name"
    t.string "company_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "course_name", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "appli_day"
    t.datetime "report_day"
    t.string "job_code", limit: 15
    t.datetime "exam_day"
    t.string "exam_place"
    t.string "exam_area", limit: 20
    t.string "exam_content"
    t.string "result", limit: 5
    t.string "aptitude_content", limit: 7
    t.string "interview", limit: 12
    t.string "question", limit: 8
    t.integer "approval_flg"
    t.integer "watch_flg"
    t.text "comment"
    t.text "reply"
    t.bigint "student_id"
    t.string "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_accounts", id: :string, limit: 9, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "password"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_accounts_on_student_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_name", limit: 30
    t.string "class_name", limit: 4
    t.integer "class_num", limit: 2
    t.string "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_accounts", id: :string, limit: 9, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "password"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_accounts_on_teacher_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "student_accounts", "students"
  add_foreign_key "teacher_accounts", "teachers"
end
