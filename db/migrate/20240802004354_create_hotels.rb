class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :cnpj
      t.string :phone
      t.string :manager

      t.timestamps
    end
  end
end
