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

ActiveRecord::Schema[7.1].define(version: 2024_08_21_173150) do
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
    t.integer "hotel_id", null: false
    t.integer "user_id", null: false
    t.index ["hotel_id"], name: "index_financial_accounts_on_hotel_id"
    t.index ["user_id"], name: "index_financial_accounts_on_user_id"
  end

  create_table "financial_classes", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.boolean "is_revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_financial_classes_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "phone"
    t.integer "address_id", null: false
    t.string "father_name"
    t.string "mother_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gender"
    t.integer "user_id", null: false
    t.index ["address_id"], name: "index_guests_on_address_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "phone"
    t.string "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.integer "guest_id", null: false
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id", null: false
    t.integer "room_id"
    t.integer "financial_class_id"
    t.integer "user_id", null: false
    t.index ["financial_class_id"], name: "index_orders_on_financial_class_id"
    t.index ["guest_id"], name: "index_orders_on_guest_id"
    t.index ["hotel_id"], name: "index_orders_on_hotel_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["room_id"], name: "index_orders_on_room_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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
    t.date "entry_date"
    t.date "execution_date"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.integer "transaction_id"
    t.integer "financial_class_id"
    t.integer "user_id", null: false
    t.integer "hotel_id"
    t.index ["financial_class_id"], name: "index_payments_on_financial_class_id"
    t.index ["hotel_id"], name: "index_payments_on_hotel_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["transaction_id"], name: "index_payments_on_transaction_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "execution_date"
    t.integer "payment_id"
    t.string "description"
    t.integer "payment_method_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transaction_type"
    t.decimal "price"
    t.integer "financial_class_id"
    t.integer "user_id", null: false
    t.index ["financial_class_id"], name: "index_transactions_on_financial_class_id"
    t.index ["payment_id"], name: "index_transactions_on_payment_id"
    t.index ["payment_method_id"], name: "index_transactions_on_payment_method_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "financial_accounts", "hotels"
  add_foreign_key "financial_accounts", "users"
  add_foreign_key "financial_classes", "users"
  add_foreign_key "guests", "addresses"
  add_foreign_key "guests", "users"
  add_foreign_key "hotels", "users"
  add_foreign_key "orders", "guests"
  add_foreign_key "orders", "hotels"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "payment_methods", "financial_accounts"
  add_foreign_key "payments", "hotels"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "transactions"
  add_foreign_key "payments", "users"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "rooms", "users"
  add_foreign_key "transactions", "payment_methods"
  add_foreign_key "transactions", "payments"
  add_foreign_key "transactions", "users"
end
