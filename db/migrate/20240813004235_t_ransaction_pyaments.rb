class TRansactionPyaments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :transactions, :payment_id, true
  end
end
