CREATE TABLE recipes(
  recipe_id SERIAL PRIMARY KEY,
  recipe_name VARCHAR(255) NOT NULL
);
CREATE TABLE comments(
  comment_id SERIAL PRIMARY KEY,
  comment VARCHAR(255) NOT NULL
);
CREATE TABLE join_table(
  id_of_comment INT REFERENCES comments(comment_id),
  id_of_recipe INT REFERENCES recipes(recipe_id)
);


# How many recipes are there in total?
"SELECT COUNT(*) AS number_of_recipes FROM recipes;"

# How many comments are there in total?
"SELECT COUNT(DISTINCT comment_id) AS number_of_comments FROM comments;"

# How would you find out how many comments each of the recipes have?
"SELECT COUNT(id_of_recipe) AS number_of_recipe_comments FROM join_table;"

# What is the name of the recipe that is associated with a specific comment?
"SELECT recipes.recipe_name, comments.comment_id WHERE join_table.comment_id = 7;"

# Add a new recipe titled Brussels Sprouts with Goat Cheese. Add two comments to it.
"INSERT INTO recipes (recipe_name) VALUES ('Brussels Sprouts with Goat Cheese');"
"INSERT INTO comments (comment_name) VALUES ('Goat cheese is awesome.', 'Brussels sprouts are not awesome.');"
"SELECT recipes.recipe_name, comments.comment_name
FROM recipes
WHERE recipes.recipe_name = 'Brussels Sprouts with Goat Cheese'
AND comments.comment_name = VALUES ('Goat cheese is awesome.', 'Brussels sprouts are not awesome.')
INNER JOIN comments
ON recipes.recipe_id=comments.comment_id;"
