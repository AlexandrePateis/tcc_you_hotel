class Payment < ApplicationRecord
  belongs_to :order
  has_one :financial_transaction, class_name: 'Transaction'

end
