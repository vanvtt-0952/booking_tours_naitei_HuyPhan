class Tour < ApplicationRecord
  belongs_to :category

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :booking_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  scope :sort_by_name, -> {order name: :desc}
  scope :hot_tour, -> {join(:book_tours ).group(tour_id).last(6)}
end
