
ActiveRecord::Schema.define(version: 2021_03_15_134735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cash_yields", force: :cascade do |t|
    t.date "date"
    t.float "value"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_cash_yields_on_project_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_chatrooms_on_project_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_favorites_on_project_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "investment_highlights", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_investment_highlights_on_project_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "chatroom_id"
    t.bigint "poll_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["poll_id"], name: "index_messages_on_poll_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.text "content"
    t.bigint "poll_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.text "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "chatroom_id", null: false
    t.index ["chatroom_id"], name: "index_polls_on_chatroom_id"
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.boolean "funded"
    t.integer "surface"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.string "crop"
    t.text "description"
    t.date "start_date"
    t.date "maturity_date"
    t.float "ltv_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "management_fee"
    t.float "transaction_fee"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "risk"
    t.string "horizon"
    t.integer "income_inv_percentage"
    t.integer "annual_income"
    t.string "risk_case"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "poll_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_option_id"], name: "index_responses_on_poll_option_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.float "amount"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_subscriptions_on_project_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cash_yields", "projects"
  add_foreign_key "chatrooms", "projects"
  add_foreign_key "favorites", "projects"
  add_foreign_key "favorites", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "polls"
  add_foreign_key "messages", "users"
  add_foreign_key "poll_options", "polls"
  add_foreign_key "polls", "chatrooms"
  add_foreign_key "polls", "users"
  add_foreign_key "responses", "poll_options"
  add_foreign_key "responses", "users"
  add_foreign_key "subscriptions", "projects"
  add_foreign_key "subscriptions", "users"
end
