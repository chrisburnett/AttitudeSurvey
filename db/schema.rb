# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140116114107) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "survey_response_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["survey_response_id"], name: "index_answers_on_survey_response_id"

  create_table "card_placements", force: true do |t|
    t.integer  "card_id"
    t.integer  "survey_response_id"
    t.integer  "sensitivity_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_placements", ["card_id"], name: "index_card_placements_on_card_id"
  add_index "card_placements", ["sensitivity_category_id"], name: "index_card_placements_on_sensitivity_category_id"
  add_index "card_placements", ["survey_response_id"], name: "index_card_placements_on_survey_response_id"

  create_table "cards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: true do |t|
    t.integer  "multi_choice_question_id"
    t.string   "choice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["multi_choice_question_id"], name: "index_choices_on_multi_choice_question_id"

  create_table "multi_choice_questions", force: true do |t|
    t.integer  "question_id"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multi_choice_questions", ["question_id"], name: "index_multi_choice_questions_on_question_id"

  create_table "questionnaire_responses", force: true do |t|
    t.integer  "survey_response_id"
    t.string   "gender"
    t.string   "employment_status"
    t.string   "age_range"
    t.text     "open_feedback"
    t.boolean  "app_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "worked_in_healthcare"
    t.string   "worked_in_healthcare_occupation"
    t.text     "comments"
  end

  add_index "questionnaire_responses", ["survey_response_id"], name: "index_questionnaire_responses_on_survey_response_id"

  create_table "questions", force: true do |t|
    t.string   "question"
    t.text     "description"
    t.integer  "survey_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", force: true do |t|
    t.string   "role"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_id"
  end

  add_index "recipients", ["survey_id"], name: "index_recipients_on_survey_id"

  create_table "sensitivity_categories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_id"
  end

  add_index "sensitivity_categories", ["survey_id"], name: "index_sensitivity_categories_on_survey_id"

  create_table "sharing_prefs", force: true do |t|
    t.integer  "card_id"
    t.integer  "survey_response_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "share"
  end

  add_index "sharing_prefs", ["card_id"], name: "index_sharing_prefs_on_card_id"
  add_index "sharing_prefs", ["recipient_id"], name: "index_sharing_prefs_on_recipient_id"
  add_index "sharing_prefs", ["survey_response_id"], name: "index_sharing_prefs_on_survey_response_id"

  create_table "slider_questions", force: true do |t|
    t.integer  "question_id"
    t.string   "min"
    t.string   "max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slider_questions", ["question_id"], name: "index_slider_questions_on_question_id"

  create_table "survey_responses", force: true do |t|
    t.string   "rnid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_run_id"
  end

  add_index "survey_responses", ["survey_run_id"], name: "index_survey_responses_on_survey_run_id"

  create_table "survey_runs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.integer  "count_of_survey_responses"
    t.integer  "survey_id"
  end

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_questions", force: true do |t|
    t.integer  "question_id"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_questions", ["question_id"], name: "index_text_questions_on_question_id"

end
