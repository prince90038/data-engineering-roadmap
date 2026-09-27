-- Date and time functions examples
-- Covers CURRENT_DATE, EXTRACT, DATE_TRUNC, and INTERVAL arithmetic.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date TIMESTAMP
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    created_at TIMESTAMP
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date)
VALUES
    (1, 1, 150.00, '2025-01-05 10:15:00'),
    (2, 2, 220.50, '2025-01-18 09:00:00'),
    (3, 1, 99.99, '2025-02-01 14:30:00'),
    (4, 3, 500.00, '2025-02-15 16:20:00'),
    (5, 2, 300.00, '2025-03-03 18:00:00');

INSERT INTO customers (customer_id, created_at)
VALUES
    (1, '2024-01-10 08:30:00'),
    (2, '2024-06-15 09:00:00'),
    (3, '2025-02-20 12:00:00');

-- 1. Current date and timestamp
SELECT CURRENT_DATE AS today, CURRENT_TIMESTAMP AS now;

-- 2. Extract year, month, and day
SELECT
    order_id,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;

-- 3. Group by month
SELECT
    DATE_TRUNC('month', order_date) AS month_start,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month_start;

-- 4. Last 7 days of orders
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';

-- 5. Orders in the current month
SELECT *
FROM orders
WHERE DATE_TRUNC('month', order_date) = DATE_TRUNC('month', CURRENT_DATE);

-- 6. Customer tenure in days
SELECT
    customer_id,
    CURRENT_DATE - created_at::date AS days_since_creation
FROM customers;

-- 7. Add 30 days to a timestamp
SELECT
    order_id,
    order_date,
    order_date + INTERVAL '30 days' AS next_30_days
FROM orders;

-- Optional cleanup
-- DROP TABLE IF EXISTS customers;
-- DROP TABLE IF EXISTS orders;
