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
  sql = "INSERT INTO ingredients (ingredient) VALUES ('#{row[1]}')"
  db_connection { |conn| conn.exec(sql) }
end

printer = "SELECT ingredient FROM ingredients"
response = db_connection { |conn| conn.exec(printer) }
response.each_with_index do |row, i|
  puts "#{i + 1}. #{row['ingredient']}"
end
