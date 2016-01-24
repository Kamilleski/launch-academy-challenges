puts "How wide is your driveway?"
width = gets.chomp.to_f
puts "How long is your driveway?"
length = gets.chomp.to_f
puts "Latest snowfall depth:"
height = gets.chomp.to_f

cubic_feet = width * length * height
puts "Cubic Feet: #{cubic_feet}"

if cubic_feet < 50
  puts "Quote Price: $20"
elsif cubic_feet < 150 && cubic_feet >= 50
  puts "Quote Price: $50"
elsif cubic_feet < 300 && cubic_feet >=150
  puts "Quote Price: $100"
else
  puts "Quote Price: $150"
end
