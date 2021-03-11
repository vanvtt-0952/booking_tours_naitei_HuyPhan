class Tour < ApplicationRecord
  belongs_to :category

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :booking_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
