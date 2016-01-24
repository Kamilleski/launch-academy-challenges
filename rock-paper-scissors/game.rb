3.times do
  #player choice
  puts "Choose rock (r), paper (p), or scissors (s): "
  player_choice = gets.chomp
  choices = {
    "r" => "rock",
    "p" => "paper",
    "s" => "scissors"
  }
  require "pry"
  binding.pry

  #computer choice
  random_num = rand(3)
  if random_num == 0
    computer_choice = "rock"
  elsif random_num == 1
    computer_choice = "paper"
  elsif random_num == 2
    computer_choice = "scissors"
  end
  puts "Skynet chose #{computer_choice}."

  #comparison of choices
  apocalypse_outcome = "Computer wins!"
  unlikely_outcome = "Humanity wins!"
  if player_choice == computer_choice
    puts "Tie!"
  elsif player_choice == "rock" && computer_choice == "scissors"
    puts "Rock beats scissors. " + unlikely_outcome
  elsif player_choice == "rock" && computer_choice == "paper"
    puts "Paper beats rock. " + apocalypse_outcome
  elsif player_choice == "paper" && computer_choice == "scissors"
    puts "Scissors beat paper. " + apocalypse_outcome
  elsif player_choice == "paper" && computer_choice == "rock"
    puts "Paper beats rock. " + unlikely_outcome
  elsif player_choice == "scissors" && computer_choice == "paper"
    puts "Scissors beat paper. " + unlikely_outcome
  elsif player_choice == "scissors" && computer_choice == "rock"
    puts "Rock beats scissors. " + apocalypse_outcome
  end
end
