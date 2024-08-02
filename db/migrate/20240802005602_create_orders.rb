class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.references :guest, null: false, foreign_key: true
      t.date :date
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
