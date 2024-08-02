class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.date :execution_date
      t.string :transaction_type
      t.references :payment, null: false, foreign_key: true
      t.string :description
      t.references :payment_method, null: false, foreign_key: true
      t.references :financial_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
