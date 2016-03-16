class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.belongs_to :book, null: false
      t.string :customer_name, null: false
    end
  end
end
