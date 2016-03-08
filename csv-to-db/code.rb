require 'pg'
require 'csv'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("ingredients.csv") do |row|
  var = row[1]
  sql = "INSERT INTO ingredients (ingredient) VALUES ($1)"
  db_connection { |conn| conn.exec_params(sql, [var]) }
end

printer = "SELECT ingredient FROM ingredients"
response = db_connection { |conn| conn.exec(printer) }
response.each_with_index do |row, i|
  puts "#{i + 1}. #{row['ingredient']}"
end
