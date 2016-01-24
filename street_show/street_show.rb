knife_juggling_tips = (2.10 + 0.77 + 5.00 + 1.00 + 3.00).round(2)
torch_juggling_tips = (6.00 + 3.50 + 7.00).round(2)
hand_balancing_tips = (2.00 + 1.00).round(2)
human_blockhead_tips = (0.75 + 0.43).round(2)
total_tips = (knife_juggling_tips + torch_juggling_tips + hand_balancing_tips + human_blockhead_tips).round(2)

puts "Knife Juggling: ",
"#{knife_juggling_tips}",
"Torch Juggling: ",
"#{torch_juggling_tips}",
"Hand Balancing: ",
"#{hand_balancing_tips}",
"Human Blockhead: ",
"#{human_blockhead_tips}"

puts "Total: ",
"#{total_tips}"

puts "Average Tip Value: ",
"#{total_tips / 12}"

puts "GATHER 'ROUND GATHER 'ROUND. If everyone is prepared to see the greatest spectacle on earth, I'll take the prettiest audience volunteer today to begin. Aha! Yes, dear. What's your name?"

name = gets.chomp

puts "Everyone give a big round of applause for our brave and beautiful volunteer, #{name}!",
"Now #{name}, what's your favorite number?"

number = gets.chomp

puts "Bellissima! If you wouldn't mind closing your eyes, we'll be hammering #{number} nails into your nasal cavity today! Try saying that #{number} times fast with a nostril full of nails!"
