transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
transactions[0]

# * What is the value of the second transaction?
second_transaction = transactions[1]

# * What is the value of the fourth transaction?
fourth_transaction = transactions[3]

# * What is the value of the last transaction?
last_transaction = transactions[-1]

# * What is the value of the second from last transaction?
second_to_last = transactions[-2]

# * What is the value of the 5th from last transaction?
fifth_to_last = transactions[-5]

# * What is the value of the transaction with index 5?
index_five = transactions[5]

# * How many transactions are there in total?
total_transactions = transactions.length

# * How many positive transactions are there in total?
positive_counter = 0
transactions.each do |number|
  if number > 0
    positive_counter += 1
  end
end
puts positive_counter

# * How many negative transactions are there in total?
negative_counter = 0
transactions.each do |number|
  if number < 0
    negative_counter += 1
  end
end
puts negative_counter

# * What is the largest withdrawal?
puts transactions.sort[0]

# * What is the largest deposit?
puts transactions.sort[-1]

# * What is the small withdrawal?
withdrawals = []
transactions.each do |number|
  if number < 0
    withdrawals.push(number)
  end
end
puts withdrawals.sort[-1]

# * What is the smallest deposit?
deposits = []
transactions.each do |number|
  if number > 0
    deposits.push(number)
  end
end
puts deposits.sort[0]

# * What is the total value of all the transactions?
total = 0
transactions.each do |number|
  total += number
end
puts total

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
total = 239900
transactions.each do |number|
  total += number
end
puts total


best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
best_records.length

# * Who are all the artists listed?
best_records.keys

# * What are all the album names in the hash?
best_records.values

# * Delete the `Eminem` key-value pair from the list.
best_records.delete('Eminem')

# * Add your favorite musician and their best album to the list.
best_records["Die Antwoord"] = "Ten$ion"

# * Change `Nirvana`'s album to another.
best_records["Nirvana"] = "In Utero"

# * Is `Nirvana` included in `best_records`?
best_records.include?("Nirvana")

# * Is `Soundgarden` included in `best_records`?
best_records.include?("Soundgarden")

# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
if !best_records.include?("Soundgarden")
  best_records["Soundgarden"] = "Telephantasm"
end

# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
best_records.each do |key, value|
  if key.length <= 6
    puts "#{key}: #{value}"
  end
end

# * Which key-value pairs have a value that is greater than 10 characters?
best_records.each do |key, value|
  if key.length >= 10
    puts "#{key}: #{value}"
  end
end
