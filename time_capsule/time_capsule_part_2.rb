#greet user
puts "Hello, friend! Please enter your name: "
user_name = gets.chomp.to_s
puts "Nice to meet you, #{user_name}. What would you like to add to the time capsule?"
time_capsule = []
input = gets.chomp.to_s

#add items
until input == "FINISHED" do
  puts "How many of those would you like in the capsule?"
  number_of_item = gets.chomp.to_i
  time_capsule = time_capsule.push(input + " (#{number_of_item})")
  puts "Anything else you'd like to add? Type 'FINISHED' when done."
  input = gets.chomp.to_s
end

#parrot back new time capsule
puts "Thank you for generating your time capsule, #{user_name}. Here is a list of everything that will be in your gigantic, cryogenically sealed vat: "
time_capsule.each do |item|
  puts "~ #{item}"
end
