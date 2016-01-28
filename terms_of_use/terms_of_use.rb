def current_program
  puts "3 + 2 = #{rand(6)}"
end

def disclaimer
  puts "***DISCLAIMER***
  This code may not work the way you expect it to.
  By using this temperamental program, you agree not to
  sue the pants off of its creator.
  ***"
end

def code_with_disclaimer
  disclaimer
  input = nil
  until input == "y"
    puts "By continuing you accept this disclaimer. Agree? (y/n)"
    input = gets.chomp.downcase
    disclaimer
  end
  current_program
  disclaimer
end

code_with_disclaimer
