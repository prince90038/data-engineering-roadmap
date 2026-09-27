-- Running totals and window frames examples
-- Covers cumulative totals and moving averages using window frames.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES
    (101, '2025-01-01', 100.00),
    (102, '2025-01-02', 130.00),
    (103, '2025-01-03', 160.00),
    (104, '2025-01-04', 175.00),
    (105, '2025-01-05', 200.00),
    (106, '2025-01-06', 240.00),
    (107, '2025-01-07', 260.00);

-- 1. Running total
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY order_date
    ) AS running_total
FROM orders;

-- 2. Moving average over the last 3 days
SELECT
    order_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3d
FROM orders;

-- 3. Total per customer-like row sequence using partition
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY DATE_TRUNC('month', order_date)
        ORDER BY order_date
    ) AS monthly_running_total
FROM orders;

-- 4. Example of cumulative count
SELECT
    order_id,
    order_date,
    total_amount,
    COUNT(*) OVER (
        ORDER BY order_date
    ) AS cumulative_count
FROM orders;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
