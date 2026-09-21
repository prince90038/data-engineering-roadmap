-- SQL Filtering examples
-- This file shows different ways to filter rows in SQL.

-- Create sample tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100),
    is_active BOOLEAN,
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO customers (customer_id, first_name, last_name, city, email, is_active, signup_date)
VALUES
    (1, 'Alice', 'Johnson', 'London', 'alice@gmail.com', TRUE, '2024-01-05'),
    (2, 'Bob', 'Smith', 'Paris', 'bob@gmail.com', TRUE, '2024-02-10'),
    (3, 'Charlie', 'Brown', 'London', 'charlie@yahoo.com', FALSE, NULL),
    (4, 'Diana', 'Lee', 'Berlin', 'diana@gmail.com', TRUE, '2024-03-15'),
    (5, 'Eve', 'Wilson', NULL, 'eve@outlook.com', NULL, '2024-04-20');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
    (101, 1, '2025-01-05', 150.00, 'paid'),
    (102, 1, '2025-01-12', 220.50, 'paid'),
    (103, 2, '2025-01-20', 99.99, 'pending'),
    (104, 2, '2025-02-01', 350.00, 'shipped'),
    (105, 3, '2025-02-14', 80.00, 'paid'),
    (106, 4, '2025-02-18', 480.00, 'cancelled'),
    (107, 5, '2025-02-25', 120.00, 'paid');

-- 1. WHERE clause
SELECT *
FROM customers
WHERE city = 'London';

-- 2. AND and OR
SELECT *
FROM orders
WHERE status = 'paid' AND total_amount > 100;

SELECT *
FROM orders
WHERE status = 'paid' OR status = 'pending';

-- 3. NOT
SELECT *
FROM customers
WHERE NOT is_active;

-- 4. IN and NOT IN
SELECT *
FROM customers
WHERE city IN ('London', 'Paris');

SELECT *
FROM customers
WHERE city NOT IN ('London', 'Paris');

-- 5. BETWEEN
SELECT *
FROM orders
WHERE total_amount BETWEEN 100 AND 500;

SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 6. LIKE
SELECT *
FROM customers
WHERE first_name LIKE 'A%';

SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

-- 7. NULL checks
SELECT *
FROM customers
WHERE city IS NULL;

SELECT *
FROM customers
WHERE city IS NOT NULL;

-- 8. Combine filters
SELECT *
FROM orders
WHERE status IN ('paid', 'shipped')
  AND total_amount >= 200
  AND order_date >= '2025-01-12';

-- 9. Example of three-valued logic with NULL
SELECT *
FROM customers
WHERE city = 'London' OR city IS NULL;

-- 10. Example of filtering active customers with email domain
SELECT customer_id, first_name, email
FROM customers
WHERE is_active = TRUE
  AND email LIKE '%@gmail.com';

-- 11. Example of date filtering
SELECT *
FROM orders
WHERE order_date >= '2025-02-01'
  AND status IN ('paid', 'shipped');

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
