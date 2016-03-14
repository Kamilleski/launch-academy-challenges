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

  add_sale = "INSERT INTO sales (employee_id, customer_id, product_id, sale_date, sale_amount, units_sold, invoice_number, invoice_frequency) VALUES ($1, $2, $3, $4, $5, $6, $7, $8);"

  add_employee = "INSERT INTO employees (first_name, last_name, email) VALUES ($1, $2, $3);"

  add_product = "INSERT INTO products (product_name) VALUES ($1);"

  add_customer = "INSERT INTO customers (name, account_number) VALUES ($1, $2);"

  get_employee_id = "SELECT id FROM employees WHERE first_name = $1 AND last_name = $2;"

  get_customer_id = "SELECT id FROM customers WHERE name = $1;"

  get_product_id = "SELECT id FROM products WHERE product_name = $1;"

  db_connection do |connection|

    connection.exec_params(add_employee, [@employee_first_name, @employee_last_name, @employee_email])

    connection.exec_params(add_product, [@product_name])

    connection.exec_params(add_customer, [@customer_name, @customer_account_no])

    employee_id_info = connection.exec_params(get_employee_id, [@employee_first_name, @employee_last_name])
    employee_foreign_id = employee_id_info[0]["id"].to_i

    customer_id_info = connection.exec_params(get_customer_id, [@customer_name])
    customer_foreign_id = customer_id_info[0]["id"].to_i

    product_id_info = connection.exec_params(get_product_id, [@product_name])
    product_foreign_id = product_id_info[0]["id"].to_i

    connection.exec_params(add_sale, [employee_foreign_id, customer_foreign_id, product_foreign_id, @sale_date, @sale_amount, @units_sold, @invoice_number, @invoice_frequency])
  end

## find id in database and store as variable, use variable when making insert statement into sales table

end
