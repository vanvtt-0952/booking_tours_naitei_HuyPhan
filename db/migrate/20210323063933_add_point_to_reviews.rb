class AddPointToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :point, :integer
  end
end
