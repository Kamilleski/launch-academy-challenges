# YOUR CODE HERE
start_num = 99
97.times do
  if start_num % 10 == 0
    punctuation = "!"
  else
    punctuation = "."
  end
  puts "\n#{start_num} bottles of beer on the wall, #{start_num} bottles of beer#{punctuation}"
  start_num = start_num - 1
  puts "Take one down, pass it around, #{start_num} bottles of beer on the wall."
end
puts "\n2 bottles of beer on the wall, 2 bottles of beer.
Take one down, pass it around, 1 bottle of beer on the wall.\n
1 bottle of beer on the wall, 1 bottle of beer.
Take one down, pass it around, no more bottles of beer on the wall.\n
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
