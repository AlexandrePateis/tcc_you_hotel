class FinancialAccount < ApplicationRecord
  has_many :payment_methods
  has_many :transactions
  belongs_to :hotel
end
