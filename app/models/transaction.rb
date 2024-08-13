class Transaction < ApplicationRecord
  belongs_to :payment_method
  has_one :payment, dependent: :destroy

  validates :execution_date, :transaction_type, :payment_method_id, :price, presence: true

  enum transaction_type: { income: 1, expense: 2 }

  after_create :create_payment

  private

  def create_payment
    Payment.create(
      date: execution_date,
      entry_date: Date.today,  # Defina conforme necessário
      execution_date: execution_date,
      order_id: nil,           # Ajuste conforme necessário
      transaction_id: self.id,
      price: self.price
    )
    self.update_column(:payment_id, payment.id)
  end
end
