class AddFinancialClassToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :financial_class
  end
end
