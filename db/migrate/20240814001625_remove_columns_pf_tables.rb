class RemoveColumnsPfTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :payments, :date
    remove_column :orders, :date
  end
end
