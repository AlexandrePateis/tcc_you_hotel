class Address < ApplicationRecord
  has_many :guests

  validates :street, :city, :state, :zip, :country, presence: true
end
