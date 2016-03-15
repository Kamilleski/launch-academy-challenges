class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.string :comment_title, null: false
      table.text :comment_body, null: false
      table.integer :recipe_id, null: false

      table.timestamps null: false
    end
  end
end
