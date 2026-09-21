-- SQL Aggregations examples
-- This file demonstrates COUNT, SUM, AVG, MIN, MAX, and DISTINCT counting.

-- Create sample tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100),
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
INSERT INTO customers (customer_id, first_name, last_name, city, email, signup_date)
VALUES
    (1, 'Alice', 'Johnson', 'London', 'alice@gmail.com', '2024-01-05'),
    (2, 'Bob', 'Smith', 'Paris', 'bob@gmail.com', '2024-02-10'),
    (3, 'Charlie', 'Brown', 'London', 'charlie@yahoo.com', '2024-03-12'),
    (4, 'Diana', 'Lee', 'Berlin', 'diana@gmail.com', '2024-04-15'),
    (5, 'Eve', 'Wilson', 'Rome', 'eve@outlook.com', '2024-05-20');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
    (101, 1, '2025-01-05', 150.00, 'paid'),
    (102, 1, '2025-01-12', 220.50, 'paid'),
    (103, 2, '2025-01-20', 99.99, 'pending'),
    (104, 2, '2025-02-01', 350.00, 'shipped'),
    (105, 3, '2025-02-14', 80.00, 'paid'),
    (106, 4, '2025-02-18', 480.00, 'cancelled'),
    (107, 5, '2025-02-25', 120.00, 'paid');

-- 1. COUNT(*)
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. COUNT(column)
SELECT COUNT(email) AS customers_with_email
FROM customers;

-- 3. COUNT(DISTINCT)
SELECT COUNT(DISTINCT customer_id) AS unique_customers_with_orders
FROM orders;

-- 4. SUM()
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- 5. AVG()
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- 6. MIN() and MAX()
SELECT MIN(total_amount) AS minimum_order_value,
       MAX(total_amount) AS maximum_order_value
FROM orders;

-- 7. Aggregation with WHERE filter
SELECT COUNT(*) AS paid_orders
FROM orders
WHERE status = 'paid';

SELECT SUM(total_amount) AS revenue_for_paid_orders
FROM orders
WHERE status = 'paid';

-- 8. Aggregation by condition
SELECT status,
       COUNT(*) AS order_count,
       SUM(total_amount) AS total_amount_by_status
FROM orders
GROUP BY status;

-- 9. Daily summary
SELECT DATE(order_date) AS order_day,
       COUNT(*) AS number_of_orders,
       SUM(total_amount) AS daily_revenue,
       AVG(total_amount) AS daily_average_order_value
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

-- 10. Distinct customer count by city
SELECT city,
       COUNT(*) AS customers_in_city
FROM customers
GROUP BY city;

-- 11. Example of counting unique customers in a specific city
SELECT city,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM customers
GROUP BY city;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
