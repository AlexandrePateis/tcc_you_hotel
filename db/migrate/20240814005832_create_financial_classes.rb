class CreateFinancialClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_classes do |t|
      t.string :name
      t.string :abbreviation
      t.boolean :is_revenue

      t.timestamps
    end
  end
end
