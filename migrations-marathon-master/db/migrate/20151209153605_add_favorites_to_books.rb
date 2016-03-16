class AddFavoritesToBooks < ActiveRecord::Migration
  def up
    add_column :books, :favorite, :boolean, default: false
  end

  def down
    remove_column :books, :favorite, :boolean
  end
end
