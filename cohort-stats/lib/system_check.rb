require_relative "lesson"

class SystemCheck < Lesson
  attr_accessor :submissions

  def initialize(name, due_date)
    @name = name
    @due_date = due_date
    @submissions = []
  end

  def add_submission(submission)
    @submissions << submission
  end

  def average_grade
    total = 0
    @submissions.each do |submission|
      total += submission.grade.to_f
    end
    total / @submissions.length
  end

  def did_student_complete_system_check?(person)
    result = false
    @submissions.each do |submission|
      if submission.student == person
        result = true
        break
      end
    end
    result
  end

  def submittable?
    true
  end
end
