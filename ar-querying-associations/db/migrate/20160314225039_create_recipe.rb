class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :recipe_name, null: false
      table.text :recipe_body, null: false

      table.timestamps null: false
    end
  end
end
