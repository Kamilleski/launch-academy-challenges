require "pg"
require "csv"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("sales.csv", headers: true, header_converters: :symbol) do |row|
  @employee_first_name = row[:employee].split(" ")[0]
  @employee_last_name = row[:employee].split(" ")[1]
  @employee_email = row[:employee].split(" ")[2].delete('()')

  @customer_name = row[:customer_and_account_no].split(" ")[0]
  @customer_account_no = row[:customer_and_account_no].split(" ")[1].delete('()')

  @product_name = row[:product_name]

  @sale_date = row[:sale_date]
  @sale_amount = row[:sale_amount].delete('$').to_f
  @units_sold = row[:units_sold].to_i

  @invoice_number = row[:invoice_no].to_i
  @invoice_frequency = row[:invoice_frequency]

  add_employee = "INSERT INTO employees (first_name, last_name, email)
  VALUES ($1, $2, $3);"
  db_connection do |connection|
    connection.exec_params(add_employee, [@employee_first_name, @employee_last_name, @employee_email])
  end

  add_customer = "INSERT INTO customers (name, account_number) VALUES ($1, $2);"
  db_connection do |connection|
    connection.exec_params(add_customer, [@customer_name, @customer_account_no])
  end

  add_sale = "INSERT INTO sales (sale_date, sale_amount, units_sold, invoice_number, invoice_frequency) VALUES ($1, $2, $3, $4, $5);"
  db_connection do |connection|
    connection.exec_params(add_sale, [@sale_date, @sale_amount, @units_sold, @invoice_number, @invoice_frequency])
  end
end
