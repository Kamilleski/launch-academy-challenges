## Part 1

def greet(name)
  puts "Hi #{name}!"
end

## Part 2

def randomized_greeting(name)
  possible_greetings = ["Hi", "Yo", "Hey", "Howdy"]
  puts "#{possible_greetings[rand(4)]} #{name}!"
end

def language_greeting(user_language = nil, name)
  if user_language == "Spanish"
    puts "Hola #{name}!"
  elsif user_language == "Italian"
    puts "Ciao #{name}!"
  elsif user_language == "French"
    puts "Bonjour #{name}!"
  elsif user_language == "Latin"
    puts "Salve #{name}!"
  else
    puts "Hi #{name}!"
  end
end
