class PaymentMethod < ApplicationRecord
  belongs_to :financial_account
  has_many :transactions

end
