class OptionalPyamnetToOrder < ActiveRecord::Migration[7.1]
  def change
    change_column_null :orders, :payment_id, true
  end
end
