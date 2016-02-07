class Student
  attr_accessor :first_name, :last_name, :pupil, :average

  def initialize(pupil)
    @first_name = pupil[:first_name]
    @last_name = pupil[:last_name]
    @grades = pupil[:grades]
    @average = (pupil[:grades].reduce(:+).to_f / pupil[:grades].length).round(2)
  end
end
