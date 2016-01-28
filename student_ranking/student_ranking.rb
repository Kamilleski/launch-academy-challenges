top_students = ["Johnny", "Jane", "Sally", "Elizabeth", "Michael"]
def rankings(top_students)
  top_students.each_with_index do |student, index|
    puts "#{index + 1}. #{student}"
  end
end

rankings(top_students)
