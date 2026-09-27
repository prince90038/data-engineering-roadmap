-- SQL performance interview questions examples

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 101, '2025-01-05', 150.00),
    (2, 101, '2025-01-10', 210.00),
    (3, 102, '2025-01-12', 95.50),
    (4, 103, '2025-01-18', 450.00),
    (5, 104, '2025-01-20', 320.00);

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_orders_order_date
ON orders(order_date);

-- 1. Filtered query: index helps if selective
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 101;

-- 2. Query with date filter on a large table may be efficient with an index
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE order_date >= '2025-01-01';

-- 3. Distinct can be expensive on large data
EXPLAIN ANALYZE
SELECT DISTINCT customer_id
FROM orders;

-- 4. Join performance depends on key selectivity and index strategy
SELECT o.order_id, o.total_amount, c.customer_id
FROM orders o
JOIN (
    SELECT customer_id
    FROM orders
    WHERE customer_id IN (101, 102)
) c
    ON o.customer_id = c.customer_id;

-- Cleanup
-- DROP TABLE IF EXISTS orders;
