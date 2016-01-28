## Part 1
def average_grade(grade_book)
  sum = 0
  grade_book.each do |grade|
    sum += grade
  end
  average_grade = sum / grade_book.length.to_f
end

students = {
"Jane": [98,95,88,97,74],
"Matt": [87,93,89,97,65],
"Samantha": [85,93,98,88,49]
}
##Part 2
def letter_grade(average_grade)
  if average_grade >= 90
    "A"
  elsif average_grade >= 80
    "B"
  elsif average_grade >= 70
    "C"
  elsif average_grade >= 60
    "D"
  else
    "F"
  end
end

students.each do |student_name, grade_array|
  puts "#{student_name}: #{letter_grade(average_grade(grade_array))} (#{average_grade(grade_array)})"
end
