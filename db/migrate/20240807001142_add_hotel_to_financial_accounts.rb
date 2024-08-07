class AddHotelToFinancialAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :financial_accounts, :hotel, null: false, foreign_key: true
  end
end
