class RemoveFinancialAccountFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_reference :transactions, :financial_account, null: false, foreign_key: true
  end
end
