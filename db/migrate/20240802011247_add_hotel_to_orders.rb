class AddHotelToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :hotel, null: false, foreign_key: true
  end
end
