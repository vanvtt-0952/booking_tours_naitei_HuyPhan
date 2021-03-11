class User < ApplicationRecord
  has_one :payment

  has_many :booking_tours, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum role: {customer: 0, admin: 1}

  has_secure_password
end
