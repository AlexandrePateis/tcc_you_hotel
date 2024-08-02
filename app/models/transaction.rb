class Transaction < ApplicationRecord
  belongs_to :payment
  belongs_to :payment_method
  belongs_to :financial_account
end
