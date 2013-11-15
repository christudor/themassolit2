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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131115150134) do

  create_table "a_levels", :force => true do |t|
    t.string   "board"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "answers", :force => true do |t|
    t.text     "answer"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "banner"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "books", :force => true do |t|
    t.text     "title"
    t.string   "author"
    t.integer  "publication_date"
    t.string   "amazon"
    t.text     "comment"
    t.integer  "lesson_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "section"
    t.string   "perseus"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.integer  "provider_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "avatar"
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "question_id"
    t.integer  "question_group_id"
    t.string   "rule"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "dependency_conditions", :force => true do |t|
    t.integer  "dependency_id"
    t.string   "rule_key"
    t.integer  "question_id"
    t.string   "operator"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "essays", :force => true do |t|
    t.text     "question"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "handouts", :force => true do |t|
    t.text     "name"
    t.integer  "lesson_id"
    t.string   "handout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "learners", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.string   "title"
    t.text     "lessondescription"
    t.string   "length"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "course_id"
    t.string   "lessonimage"
    t.string   "video"
  end

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "movie"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "profiles", ["name", "resource_type", "resource_id"], :name => "index_profiles_on_name_and_resource_type_and_resource_id"
  add_index "profiles", ["name"], :name => "index_profiles_on_name"

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "position"
    t.string   "department"
    t.string   "college"
    t.string   "university"
    t.string   "email"
    t.text     "bio"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "blog"
    t.string   "academiaedu"
    t.string   "huffpo"
  end

  create_table "qualifications", :force => true do |t|
    t.string   "board"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "quiz_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "correct_answer"
    t.text     "correct_explanation"
    t.text     "incorrect_explanation"
  end

  create_table "quizzes", :force => true do |t|
    t.text     "name"
    t.integer  "lesson_id"
    t.text     "correct_answer"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["course_id"], :name => "index_relationships_on_course_id"
  add_index "relationships", ["student_id", "course_id"], :name => "index_relationships_on_student_id_and_course_id", :unique => true
  add_index "relationships", ["student_id"], :name => "index_relationships_on_student_id"

  create_table "response_sets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "access_code"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "api_id"
  end

  add_index "response_sets", ["access_code"], :name => "response_sets_ac_idx", :unique => true
  add_index "response_sets", ["api_id"], :name => "uq_response_sets_api_id", :unique => true

  create_table "responses", :force => true do |t|
    t.integer  "response_set_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "response_group"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "survey_section_id"
    t.string   "api_id"
  end

  add_index "responses", ["api_id"], :name => "uq_responses_api_id", :unique => true
  add_index "responses", ["survey_section_id"], :name => "index_responses_on_survey_section_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "qualification"
  end

  create_table "scores", :force => true do |t|
    t.integer  "score"
    t.integer  "percentage"
    t.integer  "subscriber_id"
    t.integer  "quiz_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "possible"
  end

  create_table "sources", :force => true do |t|
    t.text     "name"
    t.string   "date"
    t.string   "link"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "wikipedia"
  end

  create_table "student_profiles", :force => true do |t|
    t.string   "school"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscriber_profiles", :force => true do |t|
    t.string   "customer_id"
    t.string   "last_4_digits"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "subscribers", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "job"
    t.integer  "school_id"
    t.string   "subject1"
    t.string   "subject2"
    t.string   "subject3"
    t.string   "subject4"
    t.string   "subject5"
    t.string   "subject6"
    t.integer  "age"
    t.string   "sex"
    t.integer  "birthday"
    t.string   "birthmonth"
    t.integer  "birthyear"
    t.date     "date_of_birth"
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email", :unique => true
  add_index "subscribers", ["reset_password_token"], :name => "index_subscribers_on_reset_password_token", :unique => true

  create_table "subscribers_profiles", :id => false, :force => true do |t|
    t.integer "subscriber_id"
    t.integer "profile_id"
  end

  add_index "subscribers_profiles", ["subscriber_id", "profile_id"], :name => "index_subscribers_profiles_on_subscriber_id_and_profile_id"

  create_table "survey_sections", :force => true do |t|
    t.integer  "survey_id"
    t.string   "title"
    t.text     "description"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "custom_class"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "survey_translations", :force => true do |t|
    t.integer  "survey_id"
    t.string   "locale"
    t.text     "translation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teacher_profiles", :force => true do |t|
    t.string   "school"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transcripts", :force => true do |t|
    t.text     "name"
    t.integer  "lesson_id"
    t.string   "transcript"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "role"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "profile_id"
    t.string   "profile_type"
    t.string   "customer_id"
    t.string   "last_4_digits"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "validation_conditions", :force => true do |t|
    t.integer  "validation_id"
    t.string   "rule_key"
    t.string   "operator"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "regexp"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "validations", :force => true do |t|
    t.integer  "answer_id"
    t.string   "rule"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
