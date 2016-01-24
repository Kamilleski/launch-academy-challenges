require 'mathn'
voters = [
  {
    "Jon Smith" => {
      age: 25,
      income: 50000,
      household_size: 1,
      female: false,
      education: "College"
    }
  },
  {
    "Jane Davies" => {
      age: 30,
      income: 60000,
      household_size: 3,
      female: true,
      education: "High School"
    }
  },
  {
    "Sam Farelly" => {
      age: 32,
      income: 80000,
      household_size: 2,
      female: nil,
      education: "College"
    }
  },
  {
    "Joan Favreau" => {
      age: 35,
      income: 65000,
      household_size: 4,
      female: true,
      education: "College"
    }
  },
  {
    "Sam McNulty" => {
      age: 38,
      income: 63000,
      household_size: 3,
      female: false,
      education: "College"
    }
  },
  {
    "Mark Minahan" => {
      age: 48,
      income: 78000,
      household_size: 5,
      female: false,
      education: "High School"
    }
  },
  {
    "Susan Umani" => {
      age: 45,
      income: 75000,
      household_size: 2,
      female: true,
      education: "College"
    }
  },
  {
    "Bill Perault" => {
      age: 24,
      income: 45000,
      household_size: 1,
      female: false,
      education: "Did not complete High School"
    }
  },
  {
    "Doug Stamper" => {
      age: 45,
      income: 75000,
      household_size: 1,
      female: false,
      education: "College"
    }
  },
  {
    "Francis Underwood" => {
      age: 52,
      income: 100000,
      household_size: 2,
      female: false,
      education: "College"
    }
  }
]

# initializing counters
age_sum = 0
income_sum = 0
household_size_sum = 0
females = 0
males = 0
unspecified_sex = 0
college_graduates = 0
high_school_graduates = 0
no_high_school = 0
voter_turnout = voters.length

# iterate through each item in the array, then each key-value pair
voters.each do |voter|
  voter.each do |key, value|
    # numerical (age, income, household) voter values
    age_sum  += value[:age]
    income_sum += value[:income]
    household_size_sum += value[:household_size]

    # sex of voters
    if value[:female] == true
      females += 1
    elsif value[:female] == false
      males += 1
    else
      unspecified_sex += 1
    end

    # education level of voters
    if value[:education] == "College"
      college_graduates += 1
    elsif value[:education] == "High School"
      high_school_graduates += 1
    else
      no_high_school += 1
    end

  end
end

puts "Average Age: #{(age_sum / voter_turnout).to_f}
Average Income: #{(income_sum / voter_turnout).to_f}
Average Household Size: #{(household_size_sum / voter_turnout).to_f}
Female: #{((females / voter_turnout) * 100).to_f} %
Male: #{((males / voter_turnout) * 100).to_f} %
Unspecified Sex: #{((unspecified_sex / voter_turnout) * 100).to_f} %
College Graduates: #{((college_graduates / voter_turnout) * 100).to_f} %
High School Graduates: #{((high_school_graduates / voter_turnout) * 100).to_f} %
Did Not Finish High School: #{((no_high_school / voter_turnout) * 100).to_f} %"
