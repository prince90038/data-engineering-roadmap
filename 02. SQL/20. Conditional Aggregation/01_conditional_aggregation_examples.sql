-- Conditional aggregation examples
-- Covers CASE inside aggregate functions for segmented reporting.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status VARCHAR(20),
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_status, total_amount)
VALUES
    (1, 1, 'paid', 120.00),
    (2, 1, 'paid', 230.00),
    (3, 2, 'cancelled', 50.00),
    (4, 2, 'paid', 310.00),
    (5, 3, 'failed', 0.00),
    (6, 4, 'paid', 450.00),
    (7, 4, 'cancelled', 90.00);

-- 1. Count statuses in one query
SELECT
    SUM(CASE WHEN order_status = 'paid' THEN 1 ELSE 0 END) AS paid_orders,
    SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN order_status = 'failed' THEN 1 ELSE 0 END) AS failed_orders,
    COUNT(*) AS total_orders
FROM orders;

-- 2. Success rate calculation
SELECT
    SUM(CASE WHEN order_status = 'paid' THEN 1 ELSE 0 END) AS successful_orders,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * SUM(CASE WHEN order_status = 'paid' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS success_rate_percent
FROM orders;

-- 3. Segmentation by amount bucket
SELECT
    SUM(CASE WHEN total_amount < 100 THEN 1 ELSE 0 END) AS small_orders,
    SUM(CASE WHEN total_amount BETWEEN 100 AND 300 THEN 1 ELSE 0 END) AS medium_orders,
    SUM(CASE WHEN total_amount > 300 THEN 1 ELSE 0 END) AS large_orders,
    COUNT(*) AS total_orders
FROM orders;

-- 4. Per-customer summary
SELECT
    customer_id,
    SUM(CASE WHEN order_status = 'paid' THEN 1 ELSE 0 END) AS paid_count,
    SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_count
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
