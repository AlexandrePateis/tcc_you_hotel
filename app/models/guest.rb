class Guest < ApplicationRecord
  belongs_to :address
  accepts_nested_attributes_for :address
  belongs_to :user

end
