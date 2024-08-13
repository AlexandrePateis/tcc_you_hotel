class AddTransactionToPaymentdsad < ActiveRecord::Migration[7.1]
  def change
    change_column_null :payments, :order_id, true
  end
end
