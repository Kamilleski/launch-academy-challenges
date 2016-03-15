ActiveRecord::Schema.define(version: 20160314225257) do

  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "comment_title", null: false
    t.text     "comment_body",  null: false
    t.integer  "recipe_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name"
    t.text   "recipe_body"
  end

end
