-- Query execution plans examples
-- Demonstrates EXPLAIN usage and common plan interpretation patterns.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris'),
    (3, 'Charlie', 'Berlin'),
    (4, 'Diana', 'Rome');

INSERT INTO orders (order_id, customer_id, total_amount, order_date)
VALUES
    (101, 1, 150.00, '2025-01-05'),
    (102, 1, 220.50, '2025-01-12'),
    (103, 2, 99.99, '2025-01-20'),
    (104, 3, 450.00, '2025-02-01');

-- 1. EXPLAIN a simple filtered query
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1;

-- 2. EXPLAIN a join query
EXPLAIN
SELECT c.customer_id, c.first_name, o.order_id, o.total_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;

-- 3. EXPLAIN ANALYZE for execution detail
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE order_date >= '2025-01-01';

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
