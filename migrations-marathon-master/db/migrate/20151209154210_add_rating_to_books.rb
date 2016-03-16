class AddRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :ratings, :integer
  end
end
