class CreateRoom < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
