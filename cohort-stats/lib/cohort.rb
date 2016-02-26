class Cohort
  attr_reader :title, :start_date, :end_date
  attr_accessor :system_checks, :students

  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @system_checks = []
    @students = []
  end

  def career_day
    @end_date + 4
  end

  def enroll(student)
    @students << student
  end

  def assign(system_check)
    @system_checks << system_check
  end

  def roster
    output = "\nCohort Roster: #{title}\n"
    output += "---------------------------"
    @students.each do |student|
      output += "#{student.name} #{student.email}\n"
    end
    output
  end

  def system_check_completed?(system_check)
    system_check.submissions.length == @students.length
  end
end
