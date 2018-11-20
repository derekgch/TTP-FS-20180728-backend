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

ActiveRecord::Schema.define(version: 2018_11_19_232359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stocks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "stock_symbol"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string "stock_symbol"
    t.integer "quantity"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trades", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_id"], name: "index_user_trades_on_trade_id"
    t.index ["user_id"], name: "index_user_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.integer "balance"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "stocks", "users"
  add_foreign_key "user_trades", "trades"
  add_foreign_key "user_trades", "users"
end