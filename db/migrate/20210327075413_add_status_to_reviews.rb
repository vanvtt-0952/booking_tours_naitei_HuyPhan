class AddStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :status, :int, default: 0
    add_column :reviews, :is_active, :boolean, default: 0
  end
end
