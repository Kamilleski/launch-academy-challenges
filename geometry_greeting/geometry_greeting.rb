## Part 1

def greet(name)
  puts "Hi #{name}!"
end

## Part 2

def randomized_greeting(name)
  possible_greetings = ["Hi", "Yo", "Hey", "Howdy"]
  puts "#{possible_greetings[rand(4)]} #{name}!"
end

randomized_greeting("Kamille")
