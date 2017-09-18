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

ActiveRecord::Schema.define(version: 20170918114700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "published"
    t.integer "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "category"
    t.string "title"
    t.string "description"
    t.integer "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guest_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_moderators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_moderators_on_reset_password_token", unique: true
  end

  create_table "not_published_opinions", force: :cascade do |t|
    t.string "author"
    t.text "words"
    t.date "visit"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opinions", force: :cascade do |t|
    t.string "author"
    t.text "words"
    t.date "visit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_in_articles", force: :cascade do |t|
    t.integer "photo"
    t.integer "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_in_events", force: :cascade do |t|
    t.integer "photo"
    t.integer "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_in_slayders", force: :cascade do |t|
    t.integer "photo"
    t.integer "slyder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "photos", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slayders", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tents", force: :cascade do |t|
    t.string "namesize"
    t.string "description"
    t.integer "icon"
    t.integer "min_size"
    t.integer "max_size"
    t.integer "hpb"
    t.integer "hpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
