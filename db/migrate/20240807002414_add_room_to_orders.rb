class AddRoomToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :room, null: false, foreign_key: true
  end
end
