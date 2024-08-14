class Payment < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :financial_transaction, class_name: 'Transaction', dependent: :destroy, optional: true
  validates :entry_date, :execution_date, presence: true
  belongs_to :financial_class

  validates :financial_class_id, presence: true
end
