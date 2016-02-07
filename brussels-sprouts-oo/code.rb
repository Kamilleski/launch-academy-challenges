class Ingredient
  attr_reader :quantity, :unit, :name

  def initialize(quantity, unit, name)
    @quantity = quantity.to_f
    @unit = unit
    @name = name
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

######## Recipes ########
# Brussels Sprouts #

rbs_name = "Roasted Brussels Sprouts"

rbs_ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

rbs_instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

brussels = Recipe.new(rbs_name, rbs_ingredients, rbs_instructions)

# Grilled Cheese #
gc_name = "Bomb-ass Grilled Cheese Sandwich"

gc_ingredients = [
  Ingredient.new(1.0, "tbsp(s)", "butter"),
  Ingredient.new(2.0, "slices", "Arizmendi's sourdough bread"),
  Ingredient.new(1.0, "smorgasbord", "cheese selection")
]

gc_instructions = [
  "Heat up a medium nonstick skillet to medium heat.",
  "Assemble a cheese sandwich with as many gooey cheese as possible, but definitely not Brie.",
  "Spread around the pat of butter once skillet is hot. Butter should bubble, but not burn.",
  "Gently deposit sandwich into the buttery fizz and place a panini press on top. (If you don't own a press, do as I do and squish it all down with a plate, then weigh down that plate with some canned items.)",
  "Once the bottom has browned after a few minutes, flip the sandwich carefully and repeat the squishing process.",
  "Once both sides are evenly browned, your sandwich is ready. Careful, the cheese will be molten hot!"
]

grilled_cheese = Recipe.new(gc_name, gc_ingredients, gc_instructions)
