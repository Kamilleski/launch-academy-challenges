board_b = [
  [nil, 'o', 'x'],
  ['x', 'o', nil],
  ['x', 'o', nil]
]

def array_printer(item)
  if item.nil?
    print "   "
  else
    print " #{item} "
  end
end

def print_grid(board)
  board.each_with_index do |array, row_index|
    array.each_with_index {|item, column_index|
      if column_index < 2
        array_printer(item)
        print "|"
      else
        array_printer(item)
      end
    }
    if row_index < 2
      puts "\n-----------\n"
    end
  end
  puts "\n"
end

puts print_grid(board_b)
