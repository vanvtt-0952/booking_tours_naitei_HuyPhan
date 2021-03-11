class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :point
      t.references :user
      t.references :tour

      t.timestamps
    end
  end
end
