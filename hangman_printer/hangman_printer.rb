def print_puzzle(word, characters_guessed = [])
  word.each_char do |char|
    if characters_guessed.include?(char)
      print "#{char.upcase} "
    else
      print "_ "
    end
  end
  print "\n"
end
