class Hotel < ApplicationRecord
  validates :name, presence: true
  has_many :financial_accounts
  belongs_to :user
end
