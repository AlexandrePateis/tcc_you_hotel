class AddGenderToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :gender, :boolean
  end
end
