puts "Enter your value here!"
sum = 0

while sum <= 100 do
  input = gets.chomp.to_f
  sum += input
end

puts "You've reached 100."
