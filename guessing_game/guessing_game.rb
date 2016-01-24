require 'pry'

#introducing the parameters of the fabulous new game show
puts "Come on down! You're our first contestant in The Guessing Game!"
puts "Would you like to play (easy) or (hard): "
difficulty = gets.chomp
if difficulty == "easy"
  high_num = 10
elsif difficulty == "hard"
  high_num = 20
end
puts "I've picked a number between 1 and #{high_num}. Now guess it!"

#initial game numbers
correct_number = rand(high_num) + 1
binding.pry
user_guess = gets.chomp.to_i
score = 1

#each time they get wrong they lose a finger or toe
while (user_guess != correct_number) do
  puts "Wrong, try again!"
  score += 1
  user_guess = gets.chomp.to_i
end

if score == 1
  puts "Wow, nice job you wizard you! Getting it right on the first try means you get to keep all of your digits!"
else
  puts "You win! I hope you're prepared to lose #{score - 1} fingers and/or toes!"
end
