DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales;


CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
  -- UNIQUE (first_name, last_name, email)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  account_number VARCHAR(255) NOT NULL
  -- UNIQUE (name, account_number)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL
);

CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  sale_date DATE NOT NULL,
  sale_amount NUMERIC NOT NULL,
  units_sold INTEGER NOT NULL,
  invoice_number INTEGER NOT NULL,
  invoice_frequency VARCHAR(255) NOT NULL,
  employee_id INTEGER REFERENCES employees(id),
  customer_id INTEGER REFERENCES customers(id),
  product_id INTEGER REFERENCES products(id)
);
