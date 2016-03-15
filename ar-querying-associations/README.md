<!-- How would you return all the recipes in your database? -->

Recipe.all

<!-- How would you return all the comments in your database? -->

Comment.all

<!-- How would you return the most recent recipe posted in your database? -->

Recipe.order(created_at: :desc).first
(Recipe.last)

<!-- How would you return all the comments of the most recent recipe in your database? -->

most_recent_recipe_id = Recipe.order(created_at: :desc).first.id

Comment.where(recipe_id: most_recent_id)

<!-- How would you return the most recent comment of all your comments? -->

Comment.order(created_at: :desc).first
(Comment.last)

<!-- How would you return the recipe associated with the most recent comment in your database? -->

most_recent_comment_id = Comment.order(created_at: :desc).first.id

Recipe.where(comment_id: most_recent_comment_id)

(Comment.last.recipe)

<!-- How would you return all comments that include the string brussels in them? -->

Comment.where("comment_body ~* ?", 'brussels')
