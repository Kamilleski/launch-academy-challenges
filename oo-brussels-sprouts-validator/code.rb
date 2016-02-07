class Ingredient
  SAFE_FOODS = [
    "brussels sprouts",
    "spinach",
    "eggs",
    "milk",
    "tofu",
    "seitan",
    "bell peppers",
    "quinoa",
    "kale",
    "chocolate",
    "beer",
    "wine",
    "whiskey"
    ]

  attr_reader :quantity, :unit, :name

  def initialize(quantity, unit, name)
    @quantity = quantity.to_f
    @unit = unit
    @name = name
  end

  def safe?
    return SAFE_FOODS.include?(@name.downcase)
  end

  def self.parse(string)
    elements = string.split(" ")
    Ingredient.new(elements[0].to_f, elements[1].to_s, elements[2].downcase)
  end

  def summary
    "#{@quantity} #{@unit} of #{@name}"
  end
end

class Recipe
  attr_reader :name, :ingredients, :instructions

  def initialize(name, ingredients, instructions)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
  end

  def i_can_haz?
    results = []
    @ingredients.each do |ingredient|
      results << ingredient.safe?
    end
    if results.include?(false)
      return false
    else
      return true
    end
  end

  def summary
    puts "Name: #{@name}\n\n"
    puts "Ingredients: \n"
    @ingredients.each do |food_item|
      print "- #{food_item.summary}\n"
    end
    puts "\nInstructions: \n"
    step = 1
    @instructions.each do |instruction|
      puts "#{step}. #{instruction}"
      step += 1
    end
    puts "\n"
  end
end

# Test Recipe 1 (all safe ingredients)
disgusting_but_safe_name = "Fresh Salad with Chocolate Cabernet Dressing"

disgusting_but_safe_ingredients = [
    Ingredient.parse("0.83 dozen Eggs"),
    Ingredient.parse("0.5 bars Chocolate"),
    Ingredient.parse("1.4 cups Kale"),
    Ingredient.new(1.5, "cups", "Spinach"),
    Ingredient.new(0.25, "cups", "Wine")
]

disgusting_but_safe_instructions = [
    "Wash and dry kale and spinach thoroughly. Mix and set aside.",
    "Hard-boil the egg and slice it thinly.",
    "Melt chocolate.",
    "Vigorously whisk the cabernet and melted chocolate until smooth.",
    "Top the greens with the sliced egg and finish off with fresh dressing.",
    "Enjoy!"
    ]

disgusting_but_safe = Recipe.new(disgusting_but_safe_name, disgusting_but_safe_ingredients, disgusting_but_safe_instructions)

# Test Recipe 2 (some safe ingredients)
smells_like_whiskey_name = "Washington Apple Cocktail"

smells_like_whiskey_ingredients = [
  Ingredient.parse("2.0 ounces Whiskey"),
  Ingredient.new(2.0, "ounces", "Sour Apple Schnapps"),
  Ingredient.new(2.0, "ounces", "Cranberry Juice")
]

smells_like_whiskey_instructions = [
  "Pour liquors into a highball glass filled with ice.",
  "Add cranberry juice to taste.",
  "Enjoy responsibly."
]

smells_like_whiskey = Recipe.new(smells_like_whiskey_name, smells_like_whiskey_ingredients, smells_like_whiskey_instructions)

# Test Case 3 (no safe ingredients)
movie_theater_popcorn_name = "Movie Theater Popcorn"

movie_theater_popcorn_ingredients = [
  Ingredient.new(0.5, "cups", "Popcorn Kernels"),
  Ingredient.new(1.0, "tbsp", "Coconut Oil"),
  Ingredient.parse("0.5 tsp Flavacol")
]

movie_theater_popcorn_instructions = [
  "Melt coconut oil in large pot over medium-low heat.",
  "Add kernels and Flavacol.",
  "Shake until kernels are well-covered.",
  "Cover pot and let cook until popping stops.",
  "Enjoy!"
]

movie_theater_popcorn = Recipe.new(movie_theater_popcorn_name, movie_theater_popcorn_ingredients, movie_theater_popcorn_instructions)

# Testing time!
def food_test(title)
  puts "Is #{title.name} safe? #{title.i_can_haz?}"
end

test_cases = [disgusting_but_safe, smells_like_whiskey, movie_theater_popcorn]

test_cases.each do |recipe_name|
  food_test(recipe_name)
end
