class RemoveGenderFromGuests < ActiveRecord::Migration[7.1]
  def change
    remove_column :guests, :gender, :string
  end
end
