class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hotels, dependent: :destroy
  has_many :financial_accounts, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :financial_classes, dependent: :destroy

end
