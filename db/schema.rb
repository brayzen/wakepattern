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

ActiveRecord::Schema.define(version: 20181006053355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentication_providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_name_on_authentication_providers"
  end

  create_table "contexts", force: :cascade do |t|
    t.string "name"
    t.string "handle"
    t.boolean "default"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contexts_on_user_id"
  end

  create_table "feedback_traits", force: :cascade do |t|
    t.integer "feedback_id"
    t.integer "trait_id"
    t.integer "rating"
    t.index ["feedback_id"], name: "index_feedback_traits_on_feedback_id"
    t.index ["trait_id"], name: "index_feedback_traits_on_trait_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "message"
    t.boolean "flagged", default: false
    t.boolean "anonymous", default: true
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.index ["receiver_id"], name: "index_feedbacks_on_receiver_id"
    t.index ["sender_id"], name: "index_feedbacks_on_sender_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
  end

  create_table "questions_responses", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "feedback_id"
    t.string "response"
    t.index ["feedback_id"], name: "index_questions_responses_on_feedback_id"
    t.index ["question_id"], name: "index_questions_responses_on_question_id"
  end

  create_table "questions_users", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id"
    t.bigint "context_id"
    t.index ["context_id"], name: "index_questions_users_on_context_id"
    t.index ["question_id"], name: "index_questions_users_on_question_id"
    t.index ["user_id"], name: "index_questions_users_on_user_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.integer "indent"
  end

  create_table "trigrams", force: :cascade do |t|
    t.string "trigram", limit: 3
    t.integer "score", limit: 2
    t.integer "owner_id"
    t.string "owner_type"
    t.string "fuzzy_field"
    t.index ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], name: "index_for_match"
    t.index ["owner_id", "owner_type"], name: "index_by_owner"
  end

  create_table "user_authentications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "authentication_provider_id"
    t.string "uid"
    t.string "token"
    t.datetime "token_expires_at"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id"
    t.index ["user_id"], name: "index_user_authentications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "handle"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contexts", "users"
  add_foreign_key "feedbacks", "users", column: "receiver_id"
  add_foreign_key "feedbacks", "users", column: "sender_id"
  add_foreign_key "questions_users", "contexts"
end
