class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.references :financial_account, null: false, foreign_key: true
      t.decimal :rate

      t.timestamps
    end
  end
end
