-- Query Optimization examples
-- Compare a less efficient query with a more optimized approach.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris'),
    (3, 'Charlie', 'Berlin'),
    (4, 'Diana', 'Rome');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2025-01-05', 150.00),
    (102, 1, '2025-01-10', 220.50),
    (103, 2, '2025-01-12', 99.99),
    (104, 3, '2025-01-14', 490.00),
    (105, 4, '2025-01-20', 320.00),
    (106, 4, '2025-02-01', 630.25);

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_orders_order_date
ON orders(order_date);

-- 1. Less efficient query: reads unnecessary columns and does more work
EXPLAIN ANALYZE
SELECT *
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_date >= '2025-01-01';

-- 2. More efficient query: narrows columns and keeps the filter selective
EXPLAIN ANALYZE
SELECT o.order_id, o.customer_id, o.total_amount, c.city
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.customer_id = 1;

-- 3. A query with unnecessary DISTINCT may be more expensive
EXPLAIN ANALYZE
SELECT DISTINCT customer_id
FROM orders
WHERE order_date >= '2025-01-01';

-- 4. A simpler filtered query is often better than extra processing
SELECT order_id, customer_id, total_amount
FROM orders
WHERE customer_id = 1
ORDER BY order_date;

-- Cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
