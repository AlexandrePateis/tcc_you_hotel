class Order < ApplicationRecord
  belongs_to :guest
  belongs_to :hotel
  belongs_to :room
  belongs_to :payment, optional: true

  before_destroy :check_for_payment

  private

  def check_for_payment
    if payment.present?
      errors.add(:base, "Não pode deletar uma order sem antes deletar seu recebimento")
      throw(:abort)
    end
  end

end
