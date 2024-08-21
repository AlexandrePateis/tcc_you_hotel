class AddHotelToPayment < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :hotel, foreign_key: true
  end
end
