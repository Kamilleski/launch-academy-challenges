class Pizza
  attr_accessor = :choices, :meats, :other_toppings, :cost

  TOPPINGS = {
  cheese: 0.10,
  green_pepper: 0.30,
  onion: 0.50,
  mushroom: 0.70,
  pepperoni: 1.10,
  jalapeno: 1.30,
  sausage: 1.70,
  bacon: 1.90
  }

  def initialize(choices = [:cheese])
    @choices = choices
    @meats = meats
    @other_toppings = other_toppings
  end

  def cost
    @cost = 8.00
    @choices.each do |ingredient|
      @cost += TOPPINGS[ingredient]
    end
  end

  def add_topping(ingredient)
    @choices << ingredient
  end

  def meats
    @meats = @choices & [:pepperoni, :bacon, :sausage]
  end

  def other_toppings
    @other_toppings = @choices & [:cheese, :green_pepper, :onion, :mushroom, :jalapeno]
  end

  def self.toppings
    TOPPINGS.each do |ingredient, price|
      puts "#{ingredient.to_s.gsub("_", " ")} : $#{'%.2f' % price}"
    end
  end
end
