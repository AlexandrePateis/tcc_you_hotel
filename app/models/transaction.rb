class Transaction < ApplicationRecord
  belongs_to :payment_method
  has_one :payment, dependent: :destroy
  belongs_to :financial_class
  belongs_to :user

  validates :execution_date, :transaction_type, :payment_method_id, :price, presence: true

  enum transaction_type: { income: 1, expense: 2 }

  after_create :create_payment

  private

  def create_payment
    Payment.create(
      execution_date: execution_date,
      order_id: nil,           # Ajuste conforme necessário
      transaction_id: self.id,
      price: self.price,
      financial_class_id: self.financial_class_id,
      user_id: self.user_id,
      entry_date: self.entry_date
    )
    self.update_column(:payment_id, payment.id)
  end
end
