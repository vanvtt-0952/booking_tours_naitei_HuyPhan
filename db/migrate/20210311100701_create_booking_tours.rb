class CreateBookingTours < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_tours do |t|
      t.integer :status, default: 0
      t.string :start_date
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.references :tour
      t.references :user

      t.timestamps
    end
  end
end
