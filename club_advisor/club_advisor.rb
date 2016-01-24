clubs = {
"driver" => 200,
"four wood" => 180,
"five wood" => 170,
"two iron" => 170,
"three iron" => 160,
"four iron" => 150,
"five iron" => 140,
"six iron" => 130,
"seven iron" => 120,
"eight iron" => 110,
"nine iron" => 95,
"pitching wedge" => 80,
"sand wedge" => 20,
"putter" => 0
}

puts "How far are you from the hole?"
input = gets.chomp.to_i

clubs.each do |key, value|
  if value <= input
    puts "You should use the #{key}."
    break
  end
end
