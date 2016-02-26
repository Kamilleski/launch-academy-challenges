class SystemCheckSubmission
  attr_reader :solution, :student
  attr_accessor :grade

  def initialize(solution, student)
    @solution = solution
    @student = student
  end

  def assign_grade(grade)
    if grade >= 0
      @grade = grade
    else
      raise InvalidGradeError, "Grade invalid!"
    end
  end

  def graded?
    !@grade.nil?
  end
end

class InvalidGradeError < StandardError
end
