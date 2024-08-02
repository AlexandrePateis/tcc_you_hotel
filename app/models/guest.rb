class Guest < ApplicationRecord
  belongs_to :address
  validates :name, :birthdate, :gender, presence: true
end
