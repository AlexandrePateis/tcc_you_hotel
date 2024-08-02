# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_02_011247) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "neighborhood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_accounts", force: :cascade do |t|
    t.string "bank"
    t.string "account_name"
    t.string "account_number"
    t.string "agency"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "phone"
    t.integer "address_id", null: false
    t.string "gender"
    t.string "father_name"
    t.string "mother_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_guests_on_address_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "phone"
    t.string "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.integer "guest_id", null: false
    t.date "date"
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id", null: false
    t.index ["guest_id"], name: "index_orders_on_guest_id"
    t.index ["hotel_id"], name: "index_orders_on_hotel_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.integer "financial_account_id", null: false
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_account_id"], name: "index_payment_methods_on_financial_account_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.date "entry_date"
    t.date "execution_date"
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "execution_date"
    t.string "transaction_type"
    t.integer "payment_id", null: false
    t.string "description"
    t.integer "payment_method_id", null: false
    t.integer "financial_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_account_id"], name: "index_transactions_on_financial_account_id"
    t.index ["payment_id"], name: "index_transactions_on_payment_id"
    t.index ["payment_method_id"], name: "index_transactions_on_payment_method_id"
  end

  add_foreign_key "guests", "addresses"
  add_foreign_key "orders", "guests"
  add_foreign_key "orders", "hotels"
  add_foreign_key "orders", "payments"
  add_foreign_key "payment_methods", "financial_accounts"
  add_foreign_key "payments", "orders"
  add_foreign_key "transactions", "financial_accounts"
  add_foreign_key "transactions", "payment_methods"
  add_foreign_key "transactions", "payments"
end
