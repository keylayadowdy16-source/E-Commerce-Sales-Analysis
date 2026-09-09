CREATE DATABASE sales_db;
USE sales_db;
CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR (50),
last_name VARCHAR(50),
email VARCHAR (100)
);
SHOW TABLES;
INSERT INTO customers (first_name, last_name, email)
VALUES
('Sarah', 'Johnson', 'sarah@email.com'),
('Mike', 'Williams', 'mike@email.com'),
('Jasmine', 'Brown', 'jasmine@email.com'),
('David', 'Smith', 'david@email.com'),
('Taylor', 'Davis', 'taylor@email.com');
SELECT * FROM customers;
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 899.99),
('Headphones', 'Electronics', 79.99),
('Backpack', 'Accessories', 49.99),
('Wireless Mouse', 'Electronics', 29.99),
('Water Bottle', 'Accessories', 19.99);
SELECT * FROM products;
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SHOW TABLES; 
INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2026-09-01'),
(2, '2026-09-02'),
(1, '2026-09-03'),
(3, '2026-09-04'),
(4, '2026-09-05'),
(5, '2026-09-06'),
(2, '2026-09-07');
SELECT * FROM orders;
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
SHOW TABLES;
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 1),
(3, 5, 3),
(4, 1, 1),
(5, 2, 2),
(6, 3, 1),
(7, 4, 2);
SELECT * FROM order_items;
SELECT
    orders.order_id,
    customers.first_name,
    customers.last_name,
    products.product_name,
    products.category,
    order_items.quantity,
    products.price
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id;
    SELECT
    orders.order_id,
    customers.first_name,
    customers.last_name,
    products.product_name,
    order_items.quantity,
    products.price,
    order_items.quantity * products.price AS total_sale
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id;
    SELECT
    SUM(order_items.quantity * products.price) AS total_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id;
    SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_units_sold
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_units_sold DESC;
SELECT
    products.product_name,
    SUM(order_items.quantity * products.price) AS total_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;
SELECT
    customers.first_name,
    customers.last_name,
    SUM(order_items.quantity * products.price) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
ORDER BY total_spent DESC;
SELECT 
    order_items.order_id,
    SUM(order_items.quantity * products.price) AS order_total
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY order_items.order_id;
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT 
        order_items.order_id,
        SUM(order_items.quantity * products.price) AS order_total
    FROM order_items
    JOIN products
        ON order_items.product_id = products.product_id
    GROUP BY order_items.order_id
) AS order_totals;
SELECT AVG(order_total) AS average_order_value
FROM (
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT 
        order_items.order_id,
        SUM(order_items.quantity * products.price) AS order_total
    FROM order_items
    JOIN products
        ON order_items.product_id = products.product_id
    GROUP BY order_items.order_id
) AS order_totals;
    INSERT INTO products (product_name, category, price)
VALUES
('Tablet', 'Electronics', 499.99),
('Smartphone', 'Electronics', 699.99),
('Keyboard', 'Electronics', 59.99),
('Monitor', 'Electronics', 249.99),
('USB Cable', 'Electronics', 12.99),
('Desk Lamp', 'Home Office', 39.99),
('Office Chair', 'Home Office', 199.99),
('Desk Organizer', 'Home Office', 24.99),
('Notebook', 'Stationery', 9.99),
('Planner', 'Stationery', 14.99),
('Pen Set', 'Stationery', 7.99),
('Sticky Notes', 'Stationery', 5.99),
('Coffee Mug', 'Accessories', 14.99),
('Phone Case', 'Accessories', 24.99),
('Laptop Stand', 'Accessories', 39.99),
('Desk Mat', 'Accessories', 29.99),
('Bluetooth Speaker', 'Electronics', 89.99),
('Webcam', 'Electronics', 69.99),
('External Hard Drive', 'Electronics', 109.99),
('Power Bank', 'Electronics', 44.99);
SELECT * FROM products;
INSERT INTO customers (first_name, last_name, email)
VALUES
('James', 'Anderson', 'james.anderson@email.com'),
('Emily', 'Brown', 'emily.brown@email.com'),
('Michael', 'Taylor', 'michael.taylor@email.com'),
('Jessica', 'Thomas', 'jessica.thomas@email.com'),
('Daniel', 'Jackson', 'daniel.jackson@email.com'),
('Ashley', 'White', 'ashley.white@email.com'),
('Christopher', 'Harris', 'christopher.harris@email.com'),
('Amanda', 'Martin', 'amanda.martin@email.com'),
('Matthew', 'Thompson', 'matthew.thompson@email.com'),
('Stephanie', 'Garcia', 'stephanie.garcia@email.com'),
('Joshua', 'Martinez', 'joshua.martinez@email.com'),
('Brittany', 'Robinson', 'brittany.robinson@email.com'),
('Andrew', 'Clark', 'andrew.clark@email.com'),
('Nicole', 'Rodriguez', 'nicole.rodriguez@email.com'),
('Anthony', 'Lewis', 'anthony.lewis@email.com'),
('Samantha', 'Lee', 'samantha.lee@email.com'),
('David', 'Walker', 'david.walker@email.com'),
('Lauren', 'Hall', 'lauren.hall@email.com'),
('Ryan', 'Allen', 'ryan.allen@email.com'),
('Megan', 'Young', 'megan.young@email.com'),
('Brandon', 'King', 'brandon.king@email.com'),
('Kayla', 'Wright', 'kayla.wright@email.com'),
('Justin', 'Scott', 'justin.scott@email.com'),
('Rachel', 'Green', 'rachel.green@email.com'),
('Kevin', 'Baker', 'kevin.baker@email.com'),
('Tiffany', 'Adams', 'tiffany.adams@email.com'),
('Eric', 'Nelson', 'eric.nelson@email.com'),
('Maria', 'Carter', 'maria.carter@email.com'),
('Tyler', 'Mitchell', 'tyler.mitchell@email.com'),
('Victoria', 'Perez', 'victoria.perez@email.com'),
('Jason', 'Roberts', 'jason.roberts@email.com'),
('Olivia', 'Turner', 'olivia.turner@email.com'),
('Nathan', 'Phillips', 'nathan.phillips@email.com'),
('Caitlin', 'Campbell', 'caitlin.campbell@email.com'),
('Derek', 'Parker', 'derek.parker@email.com'),
('Kaylee', 'Evans', 'kaylee.evans@email.com'),
('Marcus', 'Edwards', 'marcus.edwards@email.com'),
('Jasmine', 'Collins', 'jasmine.collins2@email.com'),
('Sean', 'Stewart', 'sean.stewart@email.com'),
('Brianna', 'Sanchez', 'brianna.sanchez@email.com'),
('Cameron', 'Morris', 'cameron.morris@email.com'),
('Alexis', 'Rogers', 'alexis.rogers@email.com'),
('Isaiah', 'Reed', 'isaiah.reed@email.com'),
('Destiny', 'Cook', 'destiny.cook@email.com'),
('Jordan', 'Morgan', 'jordan.morgan@email.com');
SELECT * FROM customers;
SELECT COUNT(*) AS total_customers
FROM customers;
INSERT INTO orders (customer_id, order_date)
VALUES
(8, '2026-01-05'),
(12, '2026-01-08'),
(15, '2026-01-12'),
(3, '2026-01-15'),
(21, '2026-01-20'),
(7, '2026-01-25'),
(18, '2026-02-02'),
(25, '2026-02-06'),
(30, '2026-02-10'),
(11, '2026-02-14'),
(4, '2026-02-18'),
(35, '2026-02-22'),
(42, '2026-03-01'),
(9, '2026-03-05'),
(27, '2026-03-10'),
(16, '2026-03-15'),
(33, '2026-03-20'),
(45, '2026-03-25'),
(6, '2026-04-02'),
(20, '2026-04-07'),
(14, '2026-04-12'),
(29, '2026-04-18'),
(38, '2026-04-25'),
(2, '2026-05-01'),
(24, '2026-05-06'),
(31, '2026-05-12'),
(47, '2026-05-18'),
(10, '2026-05-25'),
(19, '2026-06-02'),
(36, '2026-06-08'),
(43, '2026-06-15'),
(5, '2026-06-20'),
(22, '2026-06-27'),
(28, '2026-07-03'),
(40, '2026-07-09'),
(13, '2026-07-15'),
(34, '2026-07-21'),
(48, '2026-07-28'),
(17, '2026-08-03'),
(26, '2026-08-09'),
(37, '2026-08-15'),
(44, '2026-08-21'),
(50, '2026-08-27'),
(23, '2026-09-01'),
(41, '2026-09-03'),
(32, '2026-09-04'),
(46, '2026-09-05'),
(39, '2026-09-06'),
(49, '2026-09-07');
SELECT COUNT(*) AS total_orders
FROM orders;
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(8, 6, 1),
(9, 7, 2),
(10, 8, 1),
(11, 9, 3),
(12, 10, 2),
(13, 11, 1),
(14, 12, 2),
(15, 13, 1),
(16, 14, 3),
(17, 15, 2);
SELECT * FROM order_items;
SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_units_sold
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_units_sold DESC;
SELECT
    products.product_name,
    SUM(order_items.quantity * products.price) AS total_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;
SELECT
    products.category,
    SUM(order_items.quantity * products.price) AS category_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.category
ORDER BY category_revenue DESC;
SELECT
    customers.first_name,
    customers.last_name,
    SUM(order_items.quantity * products.price) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
ORDER BY total_spent DESC;
SELECT
    customers.first_name,
    customers.last_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
ORDER BY total_orders DESC;