class BookingTour < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  enum status: {waiting: 0, cancel: 1, appoved: 2, rejected: 3, pending: 4}
  validates :start_date, presence: true

  scope :sort_by_update_at, -> {order updated_at: :desc}
end
