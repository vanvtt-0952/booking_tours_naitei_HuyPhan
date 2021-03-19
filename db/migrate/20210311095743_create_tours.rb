class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.integer :duaration
      t.float :price
      t.references :category
      t.string :image

      t.timestamps
    end
  end
end
