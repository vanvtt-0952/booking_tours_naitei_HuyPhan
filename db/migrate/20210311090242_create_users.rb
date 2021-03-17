class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, default: 0
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
