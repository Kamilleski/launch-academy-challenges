require "pg"
require "csv"

## Can't get foreign keys to populate, even after separating csv loops

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

  db_connection do |connection|
    add_employee = "INSERT INTO employees (first_name, last_name, email) VALUES ($1, $2, $3);"

    add_product = "INSERT INTO products (product_name) VALUES ($1);"

    add_customer = "INSERT INTO customers (name, account_number) VALUES ($1, $2);"

    connection.exec_params(add_employee, [@employee_first_name, @employee_last_name, @employee_email])

    connection.exec_params(add_product, [@product_name])

    connection.exec_params(add_customer, [@customer_name, @customer_account_no])
  end
end

result = db_connection {|conn| conn.exec("SELECT id FROM employees WHERE name = 'Horror'") }

CSV.foreach("sales.csv", headers: true, header_converters: :symbol) do |row|

  @sale_date = row[:sale_date]
  @sale_amount = row[:sale_amount].delete('$').to_f
  @units_sold = row[:units_sold].to_i

  @invoice_number = row[:invoice_no].to_i
  @invoice_frequency = row[:invoice_frequency]

  get_employee_id = "SELECT id FROM employees WHERE name = #{}"

  add_sale = "INSERT INTO sales (sale_date, sale_amount, units_sold, invoice_number, invoice_frequency) VALUES ($1, $2, $3, $4, $5);"

  db_connection do |connection|
    connection.exec_params(add_sale, [@sale_date, @sale_amount, @units_sold, @invoice_number, @invoice_frequency])
  end
end
