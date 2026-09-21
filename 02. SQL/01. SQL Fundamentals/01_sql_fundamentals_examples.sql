-- SQL Fundamentals examples
-- This file demonstrates basic SQL concepts: table creation, inserts, filtering,
-- sorting, duplicates, aggregation, and limiting results.

-- 1. Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 2. Insert sample data
INSERT INTO customers (customer_id, first_name, last_name, city, email, is_active)
VALUES
    (1, 'Alice', 'Johnson', 'London', 'alice@email.com', TRUE),
    (2, 'Bob', 'Smith', 'Paris', 'bob@email.com', TRUE),
    (3, 'Charlie', 'Brown', 'London', 'charlie@email.com', FALSE),
    (4, 'Diana', 'Lee', 'Berlin', 'diana@email.com', TRUE),
    (5, 'Alice', 'Jones', 'Rome', 'alice2@email.com', TRUE);

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
    (101, 1, '2025-01-05', 150.00, 'paid'),
    (102, 1, '2025-01-08', 220.50, 'paid'),
    (103, 2, '2025-01-11', 99.99, 'pending'),
    (104, 2, '2025-01-15', 300.00, 'paid'),
    (105, 3, '2025-01-19', 75.25, 'paid'),
    (106, 4, '2025-01-22', 480.00, 'paid'),
    (107, 5, '2025-02-01', 120.00, 'cancelled');

-- 3. Basic SELECT
SELECT *
FROM customers;

SELECT customer_id, first_name, city
FROM customers;

-- 4. Filtering using WHERE
SELECT *
FROM customers
WHERE city = 'London';

SELECT *
FROM orders
WHERE total_amount > 200
  AND status = 'paid';

-- 5. Ordering results
SELECT *
FROM orders
ORDER BY order_date DESC;

-- 6. DISTINCT
SELECT DISTINCT city
FROM customers;

-- 7. LIMIT
SELECT *
FROM orders
ORDER BY total_amount DESC
LIMIT 3;

-- 8. Aggregation
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS active_customers
FROM customers
WHERE is_active = TRUE;

SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 9. HAVING
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- 10. NULL handling example
INSERT INTO customers (customer_id, first_name, last_name, city, email, is_active)
VALUES (6, 'Eva', 'Martin', NULL, 'eva@email.com', NULL);

SELECT customer_id, first_name, city, COALESCE(city, 'Unknown') AS city_or_unknown
FROM customers;

SELECT *
FROM customers
WHERE city IS NULL;

-- 11. Sorting and filtering together
SELECT first_name, city
FROM customers
WHERE is_active = TRUE
ORDER BY first_name ASC;

-- 12. Grouping with aggregate functions
SELECT
    c.city,
    COUNT(o.order_id) AS number_of_orders,
    SUM(o.total_amount) AS total_revenue,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 13. Example of HAVING after aggregation
SELECT
    c.customer_id,
    c.first_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_spent DESC;

-- 14. Common practice: filter before aggregation
SELECT customer_id, COUNT(*) AS orders_count
FROM orders
WHERE status = 'paid'
GROUP BY customer_id
HAVING COUNT(*) >= 2;

-- 15. Example of a view
CREATE VIEW active_customer_orders AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.is_active = TRUE;

SELECT *
FROM active_customer_orders;

-- 16. Clean up examples if needed in a sandbox database
-- DROP VIEW IF EXISTS active_customer_orders;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
