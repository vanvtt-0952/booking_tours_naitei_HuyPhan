class BookingTour < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  enum status: {waiting: 0, cancel: 1, appoved: 2, reject: 3, pending: 4}
end
