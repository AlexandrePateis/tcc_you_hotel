class Transaction < ApplicationRecord
  belongs_to :payment
  belongs_to :payment_method
  enum transaction_type: { income: 1, expense: 2 }

end
