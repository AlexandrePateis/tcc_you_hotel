class AddPriceToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :price, :decimal
  end
end
