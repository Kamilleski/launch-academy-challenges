puts "Good day, sir and/or madam. How many adult tickets will you be purchasing today?"
adult_tickets = gets.chomp

puts "Very good, sir and/or madam. Additionally, how many child tickets will you need?"
child_tickets = gets.chomp

puts "Here are your #{adult_tickets} adult tickets and #{child_tickets} child tickets."

hot_dog = 1.27
hamburger = 4.17
funnel_cake = 3.79
ice_cream_sandwich = 0.75

puts "Two hamburgers and two ice cream sandwiches costs $#{(2 * hamburger) + (2 * ice_cream_sandwich)}.",
"Eight funnel cakes and a hot dog costs $#{(8 * funnel_cake) + hot_dog}.",
"Three of each item on the menu costs $#{(hot_dog + hamburger + funnel_cake + ice_cream_sandwich) * 3}."
