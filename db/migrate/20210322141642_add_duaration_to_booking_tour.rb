class AddDuarationToBookingTour < ActiveRecord::Migration[6.0]
  def change
    add_column :booking_tours, :duaration, :integer
    add_column :booking_tours, :quantity_person, :integer
    add_column :booking_tours, :note, :text
    add_column :booking_tours, :price, :integer
    add_column :booking_tours, :total_price, :integer
  end
end
