# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_03_121302) do

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

  create_table "comment_votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "value", default: 0
    t.index ["comment_id"], name: "index_comment_votes_on_comment_id"
    t.index ["user_id"], name: "index_comment_votes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "quote_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "comment_votes_count", default: 0
    t.integer "parent_id"
    t.string "source"
    t.index ["quote_id"], name: "index_comments_on_quote_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string "folder_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "content"
    t.bigint "source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url_of_quote"
    t.bigint "user_id", null: false
    t.index ["source_id"], name: "index_quotes_on_source_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "asker_id", null: false
    t.bigint "receiver_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asker_id"], name: "index_relationships_on_asker_id"
    t.index ["receiver_id"], name: "index_relationships_on_receiver_id"
  end

  create_table "source_tags", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_id"], name: "index_source_tags_on_source_id"
    t.index ["tag_id"], name: "index_source_tags_on_tag_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.string "website"
    t.date "date_of_article"
    t.string "url_of_website"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
    t.bigint "source_tag_id"
    t.bigint "folder_id"
    t.index ["folder_id"], name: "index_sources_on_folder_id"
    t.index ["source_tag_id"], name: "index_sources_on_source_tag_id"
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "source_tag_id"
    t.bigint "user_tag_id"
    t.index ["source_tag_id"], name: "index_tags_on_source_tag_id"
    t.index ["user_tag_id"], name: "index_tags_on_user_tag_id"
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "authentication_token", limit: 30
    t.bigint "user_tag_id"
    t.boolean "email_notifications", default: true
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_tag_id"], name: "index_users_on_user_tag_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_votes", "comments"
  add_foreign_key "comment_votes", "users"
  add_foreign_key "comments", "quotes"
  add_foreign_key "comments", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "quotes", "sources"
  add_foreign_key "quotes", "users"
  add_foreign_key "relationships", "users", column: "asker_id"
  add_foreign_key "relationships", "users", column: "receiver_id"
  add_foreign_key "source_tags", "sources"
  add_foreign_key "source_tags", "tags"
  add_foreign_key "sources", "folders"
  add_foreign_key "sources", "source_tags"
  add_foreign_key "sources", "users"
  add_foreign_key "tags", "source_tags"
  add_foreign_key "tags", "user_tags"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
  add_foreign_key "users", "user_tags"
end
