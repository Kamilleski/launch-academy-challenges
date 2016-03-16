class CreateCategorizations < ActiveRecord::Migration
  def change
    create_join_table :books, :categories, table_name: :categorizations do |t|
      t.index :book_id
      t.index :category_id
    end
  end
end
