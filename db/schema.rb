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

ActiveRecord::Schema.define(version: 20161008083721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beneficiaries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "card_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.float    "target_amount"
    t.float    "penalty_amount"
    t.boolean  "is_goal_validated"
    t.datetime "deadline"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "beneficiary_id"
    t.index ["beneficiary_id"], name: "index_goals_on_beneficiary_id", using: :btree
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "individual_pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "contributed_amount"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "total_pledge_id"
    t.index ["total_pledge_id"], name: "index_individual_pledges_on_total_pledge_id", using: :btree
    t.index ["user_id"], name: "index_individual_pledges_on_user_id", using: :btree
  end

  create_table "total_pledges", force: :cascade do |t|
    t.float    "pledged_total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.boolean  "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.boolean  "is_admin"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "goals", "beneficiaries"
  add_foreign_key "goals", "users"
  add_foreign_key "individual_pledges", "total_pledges"
  add_foreign_key "individual_pledges", "users"
end
