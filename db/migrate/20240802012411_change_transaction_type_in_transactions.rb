class ChangeTransactionTypeInTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :transaction_type, :string
  end
end
