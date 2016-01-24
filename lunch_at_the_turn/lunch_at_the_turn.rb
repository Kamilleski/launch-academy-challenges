menu = [
  {
    name: "hamburger",
    price: 3.00
  },
  {
    name: "hot dog",
    price: 4.00
  },
  {
    name: "fries",
    price: 2.00
  },
  {
    name: "chips",
    price: 1.00
  },
  {
    name: "water",
    price: 1.25
  },
  {
    name: "soda",
    price: 1.50
  }
]

puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?"

order = gets.chomp.downcase.split(",")
puts order

cost = 0.00
for i in order do
  menu.each do |menu_items|
    if menu_items[:name] == order[i]
      cost += menu_items[:price]
    else
      puts "We don't carry '#{order[i]}.'"
      break
    end
  end
end
