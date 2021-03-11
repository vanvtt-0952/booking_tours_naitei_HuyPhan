class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :parent_id
      t.references :review
      t.references :user

      t.timestamps
    end
  end
end
