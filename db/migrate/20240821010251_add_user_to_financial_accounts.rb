class AddUserToFinancialAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :financial_accounts, :user, null: false, foreign_key: true
  end
end
