class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :bank_number
      t.date :expiry_date
      t.string :token
      t.float :balance
      t.references :user

      t.timestamps
    end
  end
end
