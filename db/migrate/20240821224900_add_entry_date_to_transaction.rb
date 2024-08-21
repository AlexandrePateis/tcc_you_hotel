class AddEntryDateToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :entry_date, :date
  end
end
