def plus_two(number)
  number + 2
end

def subtract_or_multiply_by_two(number)
  if number < 0
    number - 2
  else
    number * 2
  end
end

def repeat_last_word(string)
  string << " " + string.split(" ").last
end

def give_example(input)
  if input.include?('string')
    return "A string will be wrapped in quotes."
  elsif input.include?('fixnum')
    return 21
  else
    return "input does not match any Ruby class"
  end
end

def output_to_terminal
  puts 'Hello World'
end

def add_five_and_ten(array)
  array << 5
  array << 10
end
