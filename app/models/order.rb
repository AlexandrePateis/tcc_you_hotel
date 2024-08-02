class Order < ApplicationRecord
  belongs_to :guest
  belongs_to :payment
  belongs_to :hotel
end
