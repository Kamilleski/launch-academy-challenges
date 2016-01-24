# Defining variables
human_score = 0
computer_score = 0

computer_options = ["rock", "paper", "scissors"]
human_options = {
  "r" => "rock",
  "p" => "paper",
  "s" => "scissors"
}

apocalypse_outcome = "Computer wins... \n"
unlikely_outcome = "Humanity wins! \n"

until human_score + computer_score == 3 do
  puts "Player Score: #{human_score}  Computer Score: #{computer_score}"

  # player's choice
  print "Choose rock (r), paper (p), or scissors (s): "
  human_choice = gets.chomp.downcase
  puts "Player chose #{human_options[human_choice]}."
  abort("The choice of (#{human_choice}) was invalid. Game over. This is why we can't have nice things!") unless human_options.include?(human_choice)

  #computer's choice
  computer_choice = computer_options[rand(3)]
  puts "Computer chose #{computer_choice}."

  human_won = false
  computer_won = false

  if human_options[human_choice] == "rock" && computer_choice == "scissors"
    human_won = true
  elsif human_options[human_choice] == "rock" && computer_choice == "paper"
    computer_won = true
  elsif human_options[human_choice] == "paper" && computer_choice == "scissors"
    computer_won = true
  elsif human_options[human_choice] == "paper" && computer_choice == "rock"
    human_won = true
  elsif human_options[human_choice] == "scissors" && computer_choice == "paper"
    human_won = true
  elsif human_options[human_choice] == "scissors" && computer_choice == "rock"
    computer_won = true
  end

  if human_won
    puts "In this round #{human_options[human_choice]} beats #{computer_choice}. " + unlikely_outcome
    human_score += 1
  elsif computer_won
    puts "In this round #{computer_choice} beats #{human_options[human_choice]}. " + apocalypse_outcome
    computer_score += 1
  else
    puts "Tie! Choose again."
  end

  puts "\n"
end

puts "Final Score => Player: #{human_score}  Computer: #{computer_score}"

if computer_score > human_score
  puts "Computer wins!"
else
  puts "Humanity wins!"
end
