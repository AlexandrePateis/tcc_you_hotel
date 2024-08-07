class DropRoomsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :rooms
  end

  def down
    create_table "rooms" do |t|
      t.string "name"
      t.text "description"
      t.decimal "price"
      t.integer "hotel_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
    end
  end
end
