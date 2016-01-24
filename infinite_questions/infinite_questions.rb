while true do
  puts "Can I get you anything?"
  input = gets.chomp
  if input == 'no' || input == 'No'
    puts "Okay, goodbye!"
    break
  end
end
