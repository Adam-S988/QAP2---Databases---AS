--Creating the Tables
CREATE TABLE products (id SERIAL PRIMARY KEY, product_name TEXT, price DECIMAL (10,2), stock_quantity INT)

CREATE TABLE customers (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email INT)

CREATE TABLE orders (id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(id), oder_date DATE)

CREATE TABLE order_items (order_id INT REFERENCES orders(id), product_id INT REFERENCES products(id), quantity INT, PRIMARY KEY (order_id, product_id)