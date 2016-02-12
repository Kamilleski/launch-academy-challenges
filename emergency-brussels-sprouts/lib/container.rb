require_relative 'ingredient'

class Container
	attr_accessor :ingredients
	attr_reader :weight, :maximum_holding_weight, :max_times

	def initialize(weight, maximum_holding_weight)
		@weight = weight
		@maximum_holding_weight = maximum_holding_weight
		@ingredients = []
	end

## the method that caused me to unfairly yell at my boyfriend because the .times
## method in ruby is way more obtuse than the 'for()' in javascript
	def fill_with_ingredient(ingredient)
		@max_times = (maximum_holding_weight / ingredient.weight).floor
		@max_times.times do |counter|
			ingredients << ingredient
		end
		@weight = @weight + @maximum_holding_weight
	end

	def which_ingredient
	 ingredients[0].name
	end

	def how_many_ingredients
		ingredients.length
	end

	def remove_one_ingredient
		ingredients.pop
	end

	def empty
		ingredients = []
	end
end
