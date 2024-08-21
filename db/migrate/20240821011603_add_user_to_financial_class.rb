class AddUserToFinancialClass < ActiveRecord::Migration[7.1]
  def change
    add_reference :financial_classes, :user, null: false, foreign_key: true
  end
end
