class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.date :birthdate
      t.string :phone
      t.references :address, null: false, foreign_key: true
      t.string :gender
      t.string :father_name
      t.string :mother_name

      t.timestamps
    end
  end
end
