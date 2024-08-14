class AddFinancialClassToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :financial_class
  end
end
