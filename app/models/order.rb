class Order < ApplicationRecord
  belongs_to :guest
  belongs_to :payment
end