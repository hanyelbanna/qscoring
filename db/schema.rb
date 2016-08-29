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

ActiveRecord::Schema.define(version: 20160829073926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_plans", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description"
    t.boolean  "closed",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "frequencies", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "description"
    t.integer  "days",        default: 30, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "history_scores", force: :cascade do |t|
    t.integer  "score"
    t.integer  "standard_id",    null: false
    t.integer  "user_id",        null: false
    t.integer  "validator_id",   null: false
    t.text     "scorer_note"
    t.text     "validator_note"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["standard_id"], name: "index_history_scores_on_standard_id", using: :btree
    t.index ["user_id"], name: "index_history_scores_on_user_id", using: :btree
    t.index ["validator_id"], name: "index_history_scores_on_validator_id", using: :btree
  end

  create_table "history_trend_chapters", force: :cascade do |t|
    t.decimal  "score",      precision: 4, scale: 1
    t.integer  "chapter_id",                         null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["chapter_id"], name: "index_history_trend_chapters_on_chapter_id", using: :btree
  end

  create_table "history_trend_departments", force: :cascade do |t|
    t.decimal  "score",         precision: 4, scale: 1
    t.integer  "department_id",                         null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["department_id"], name: "index_history_trend_departments_on_department_id", using: :btree
  end

  create_table "history_trends", force: :cascade do |t|
    t.decimal  "score",      precision: 4, scale: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "standards", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description"
    t.integer  "chapter_id",                     null: false
    t.integer  "department_id"
    t.integer  "user_id",                        null: false
    t.integer  "validator_id",                   null: false
    t.integer  "frequency_id",                   null: false
    t.date     "review_date"
    t.integer  "score"
    t.integer  "score_for_avg",  default: 0
    t.text     "scorer_note"
    t.text     "validator_note"
    t.integer  "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "bold",           default: false, null: false
    t.index ["chapter_id"], name: "index_standards_on_chapter_id", using: :btree
    t.index ["department_id"], name: "index_standards_on_department_id", using: :btree
    t.index ["frequency_id"], name: "index_standards_on_frequency_id", using: :btree
    t.index ["user_id"], name: "index_standards_on_user_id", using: :btree
    t.index ["validator_id"], name: "index_standards_on_validator_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description"
    t.date     "due_date"
    t.boolean  "completed",      default: false
    t.date     "completed_date"
    t.integer  "user_id",                        null: false
    t.text     "user_note"
    t.integer  "action_plan_id",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["action_plan_id"], name: "index_tasks_on_action_plan_id", using: :btree
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "mobile",                              null: false
    t.string   "type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "history_scores", "standards"
  add_foreign_key "history_scores", "users"
  add_foreign_key "history_scores", "users", column: "validator_id"
  add_foreign_key "history_trend_chapters", "chapters"
  add_foreign_key "history_trend_departments", "departments"
  add_foreign_key "standards", "chapters"
  add_foreign_key "standards", "departments"
  add_foreign_key "standards", "frequencies"
  add_foreign_key "standards", "users"
  add_foreign_key "standards", "users", column: "validator_id"
  add_foreign_key "tasks", "action_plans"
  add_foreign_key "tasks", "users"

  
  create_trigger("standards_before_insert_row_tr", :generated => true, :compatibility => 1).
      on("standards").
      before(:insert) do
    <<-SQL_ACTIONS

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;
    SQL_ACTIONS
  end

  create_trigger("standards_before_update_of_score_status_row_tr", :generated => true, :compatibility => 1).
      on("standards").
      before(:update).
      of(:score, :status) do
    <<-SQL_ACTIONS

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;
    SQL_ACTIONS
  end

end
