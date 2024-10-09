--Creating the Tables
CREATE TABLE products (id SERIAL PRIMARY KEY, product_name TEXT, price DECIMAL (10,2), stock_quantity INT)

CREATE TABLE customers (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT)

CREATE TABLE orders (id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(id), order_date DATE)

CREATE TABLE order_items (order_id INT REFERENCES orders(id), product_id INT REFERENCES products(id), quantity INT, PRIMARY KEY (order_id, product_id)

--Inserting the Data
INSERT INTO products(product_name, price, stock_quantity)
VALUES ('Plain Bagel', 1.95, 90),
('Chocolate Chip Cookie', 1.49, 80),
('Ham Sandwich', 6.49, 30),
('Blueberry Scone', 2.49, 40),
('Chicken Wrap', 7.99, 25);

INSERT INTO customers(first_name, last_name, email)
VALUES ('Gretchen', 'Weiners', 'sofetch@gmail.com'),
('Tina', 'Fey', 'norbury@gmail.com'),
('Amy', 'Adams', 'burnbook04@gmail.com'),
('Amanda', 'Seyfried', 'fifthsense@gmail.com'),
('Amy', 'Poehler', 'cool.mom@gmail.com');

INSERT INTO orders (customer_id, order_date)
VALUES('1', 'May 16, 2024'),
('1', 'June 2, 2024'),
('2', 'July 14, 2024'),
('3', 'July 24, 2024'),
('4', 'August 1, 2024');

INSERT INTO order_items(order_id, product_id, quantity)
VALUES(1, 3, 2),
(1, 4, 1),
(2, 1, 5),
(2, 2, 2),
(3, 3, 1),
(3, 4, 5),
(3, 5, 8),
(4, 1, 6),
(4, 2, 6),
(5, 4, 3),
(5, 5, 1);