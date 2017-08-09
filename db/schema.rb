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

ActiveRecord::Schema.define(version: 20170809142044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_oauth_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "uid", null: false
    t.string "provider", null: false
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.string "url"
    t.string "image_url"
    t.string "access_token"
    t.string "access_secret"
    t.text "raw_info", null: false
    t.text "credentials", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "provider"], name: "index_auth_oauth_accounts_on_uid_and_provider", unique: true
    t.index ["user_id"], name: "index_auth_oauth_accounts_on_user_id"
  end

  create_table "github_login_names", id: :string, force: :cascade do |t|
  end

  create_table "github_repositories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_github_repositories_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "login_name", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
  end

  add_foreign_key "auth_oauth_accounts", "users"
end
