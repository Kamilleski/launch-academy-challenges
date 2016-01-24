people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Domenick",
          "Trycia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nitzsche and Dickinson"
  }
}


# Write Ruby code to find out the answers to the following questions:

# * How many people are in `people` (excluding children)?
people.length

# * What are the names of all the people?
people.keys

# * What is the phone number of Alia O'Conner PhD?
people["Alia O'Conner PhD"]["phone"]

# * How many children does Brian Heller have?
people["Brian Heller"]["children"].length

# * What company does Dr. Adela DuBuque work for?
people["Dr. Adela DuBuque"]["company"]

# * What are the names of the people who have children?
##HELPME
##iteration over compound data structures
##using variables/methods? instead of strings/indices
parents = []
people.each do |key, value|
  if value["children"] != nil
    parents.push(key)
  end
end
puts parents

# * What are the names of the people who do not have children?
people.keys - parents

# * What is Brian Heller's child's name?
people["Brian Heller"]["children"]

# * What is Maryse Johns' first child's name?
people["Maryse Johns"]["children"][0]

# * Dr. Adela DuBuque just had a baby named Tomas. How would you update the hash for this information?
people["Dr. Adela DuBuque"]["children"] = ["Tomas"]

sets_of_people =
[
  {
         "Bernard Feil" => {
             "phone" => "(880) 434-0630",
           "company" => "Maggio Inc",
          "children" => [
              "Nikki"
          ]
      },
          "Ruby Hessel" => {
             "phone" => "1-467-852-4981",
           "company" => "Kemmer Inc",
          "children" => [
              "Sydney"
          ]
      },
          "Savanah Toy" => {
             "phone" => "440-632-0287",
           "company" => "Hudson, Stehr and Lind",
          "children" => [
              "Garth"
          ]
      },
      "Casandra Kemmer" => {
            "phone" => "1-515-759-7470",
          "company" => "Davis, Bernier and Hermann"
      },
             "Edd Rath" => {
            "phone" => "(522) 829-3164",
          "company" => "Mosciski LLC"
      }
  },
  {
         "Dagmar Brakus" => {
             "phone" => "1-881-313-1173",
           "company" => "Mitchell, Schmitt and Haley",
          "children" => [
              "Reuben"
          ]
      },
         "Einar Effertz" => {
            "phone" => "(265) 857-5141",
          "company" => "Pfeffer, Klocko and Von"
      },
      "Dr. Sigrid Nader" => {
             "phone" => "707.762.7870",
           "company" => "Weissnat, Hayes and Dickinson",
          "children" => [
              "Israel",
              "Elyse",
              "Wilfredo"
          ]
      }
  }
]

# Write Ruby code to find out the answers to the following questions:

# * How many people are in the first set of people?
sets_of_people[0].length

# * How many people are in the second set of people?
sets_of_people[1].length

# * What is Ruby Hessel's phone number?
sets_of_people[0]["Ruby Hessel"]["phone"]

# * What are the names of Dr. Sigrid Nader's children?
sets_of_people[1]["Dr. Sigrid Nader"]["children"]

# * What is Bernard Feil's child's name?
sets_of_people[0]["Bernard Feil"]["children"]

# * What company does Casandra Kemmer work for?
sets_of_people[0]["Casandra Kemmer"]["company"]

# * Who are all the people in the first set that have an `m` in their Company names?
## I know this is clunky, but I couldn't ever figure out another way to iterate through multidimensional data structures like this.
m_company_people = []
sets_of_people.each do |people_group|
    people_group.each do |key, value|
    if value["company"].downcase.include?("m")
      m_company_people.push(key)
    end
  end
end
