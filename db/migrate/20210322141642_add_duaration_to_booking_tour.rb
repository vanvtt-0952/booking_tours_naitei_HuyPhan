class AddDuarationToBookingTour < ActiveRecord::Migration[6.0]
  def change
    add_column :booking_tours, :duaration, :integer
    add_column :booking_tours, :quantity_persion, :integer
  end
end
