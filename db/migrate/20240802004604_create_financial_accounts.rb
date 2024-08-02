class CreateFinancialAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_accounts do |t|
      t.string :bank
      t.string :account_name
      t.string :account_number
      t.string :agency
      t.text :description

      t.timestamps
    end
  end
end
