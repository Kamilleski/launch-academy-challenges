
##get and store user input
puts "Hello, I'm the world's first and only talking vending machine. What would you like?"
snack = gets.chomp
puts "How many of those would you like?"
amount = gets.chomp

##check whether amount is a number or 'tons'
if amount.to_i > 0
  amount = amount.to_i
elsif amount.index("tons") != nil?
  amount = rand(14)
end

##dispense the goods!
amount.times do
  if amount == 0
    break
  else
    puts snack
  end
end
puts "Thank you, please come again."
