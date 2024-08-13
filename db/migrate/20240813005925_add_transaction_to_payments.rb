class AddTransactionToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :transaction, foreign_key: true
  end
end
