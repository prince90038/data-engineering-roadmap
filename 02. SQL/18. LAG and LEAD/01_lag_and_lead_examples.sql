-- LAG and LEAD examples
-- Covers previous and next row comparisons in ordered data.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2025-01-01', 100.00),
    (102, 1, '2025-01-05', 180.00),
    (103, 1, '2025-01-10', 150.00),
    (104, 2, '2025-01-02', 90.00),
    (105, 2, '2025-01-08', 300.00),
    (106, 2, '2025-01-12', 260.00);

-- 1. Compare current sales to previous day
SELECT
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS previous_amount,
    total_amount - LAG(total_amount) OVER (ORDER BY order_date) AS amount_change
FROM orders;

-- 2. Compare current sales to next day
SELECT
    order_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_amount
FROM orders;

-- 3. Compare within each customer sequence
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount
FROM orders;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
