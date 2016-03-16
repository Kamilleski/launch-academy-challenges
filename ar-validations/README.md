<!-- Validate that the title of each recipe exists. -->

Recipe.titles.valid?

<!-- Validate that the title of each recipe is unique. -->

Recipe.titles.valid?


<!-- Validate that the title of each recipe contains "Brussels sprouts" in it. -->

Recipe.titles.valid?


<!-- Validate that the length of a comment be a maximum of 140 characters long. -->

Comment.all.body.valid?

<!-- Validate that a comment has a recipe. -->

Comment.all.recipe_id.valid?

<!-- Add a field servings to your Recipe table. This field is optional, but if supplied, it must be greater than or equal to 1. Write a validation for this. -->
