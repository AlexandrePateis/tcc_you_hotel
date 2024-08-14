class AddFinancialClassToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :financial_class
  end
end
