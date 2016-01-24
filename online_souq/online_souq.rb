puts "Welcome, stranger. What's your name?"
name = gets.chomp

items = ["old paperback book", "potato", "red onion", "dried lemon", "frankincense", "medicinal herbs", "saffron", "glass spice jar", "red fabric", "orange fabric", "handicrafts", "small Persian rug", "medium Persian rug", "large Persian rug", "extra large Persian rug"]

puts "Here is a list of items you can buy:"
items.each do |item|
  puts "~ #{item}"
end
puts "Of those items, which would you like to buy? Type 'FINISHED' when done."

desired_item = nil
souq_cart = []
items_not_carried = []

until desired_item == "FINISHED" do
  desired_item = gets.chomp
  if items.include?(desired_item)
    souq_cart.push(desired_item)
  else
    if desired_item != "FINISHED"
      items_not_carried.push(desired_item)
    end
  end
end

puts "Here is a list of everything in your cart: "
souq_cart.each do |item|
  puts "+ #{item}"
end
puts "Here is a list of everything you want that we don't carry: "
items_not_carried.each do |item|
  puts "- #{item}"
end
