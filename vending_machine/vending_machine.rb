items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"
puts "Which item would you like?"
input = gets.chomp
item_index = items_we_have.index(input)
if item_index.nil?
  puts "We don't carry that item."
else
  puts "Item index: #{item_index}"
end
