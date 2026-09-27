-- Data Quality Framework project example

CREATE TABLE customer_data (
    customer_id INT,
    customer_name VARCHAR(200),
    signup_date DATE,
    city VARCHAR(100)
);

CREATE TABLE orders_data (
    order_id INT,
    customer_id INT,
    order_total DECIMAL(10,2)
);

INSERT INTO customer_data (customer_id, customer_name, signup_date, city)
VALUES
    (1, 'Alice', '2025-01-05', 'London'),
    (2, 'Bob', NULL, 'Paris'),
    (2, 'Bob', NULL, 'Paris'),
    (3, NULL, '2025-02-01', 'Berlin');

INSERT INTO orders_data (order_id, customer_id, order_total)
VALUES
    (101, 1, 150.00),
    (102, 99, 220.00),
    (103, 3, -15.00);

-- 1. Missing required values
SELECT 'missing_signup_date' AS check_name,
       COUNT(*) AS failed_count
FROM customer_data
WHERE signup_date IS NULL;

-- 2. Duplicate customer ids
SELECT 'duplicate_customer_id' AS check_name,
       COUNT(*) AS failed_count
FROM (
    SELECT customer_id
    FROM customer_data
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) dup;

-- 3. Referential integrity check
SELECT 'missing_customer_reference' AS check_name,
       COUNT(*) AS failed_count
FROM orders_data o
LEFT JOIN customer_data c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 4. Negative totals check
SELECT 'negative_order_total' AS check_name,
       COUNT(*) AS failed_count
FROM orders_data
WHERE order_total < 0;

-- Cleanup
-- DROP TABLE IF EXISTS orders_data;
-- DROP TABLE IF EXISTS customer_data;
