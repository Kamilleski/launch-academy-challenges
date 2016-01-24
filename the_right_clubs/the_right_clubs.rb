REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

required_clubs = ["driver", "pitching wedge", "putter"]

club_strings = []
available_clubs.each do |club|
  club = club.to_s.gsub(/_/, " ")
  club_strings.push(club)
end
puts club_strings

possible_club_selections =  club_strings.sample(REQUIRED_BAG_SIZE)

puts "*** Automated Golf Club Advice ***"
possible_club_selections.each do |item|
  puts "Use the #{item}! \n"
end

required_clubs.each do |item|
  if possible_club_selections.include?(item) == false
    puts "WARNING: This selection does not include a #{item}."
  end
end
