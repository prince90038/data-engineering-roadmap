-- SQL dialect examples
-- Illustrates patterns that are similar across systems, with small dialect differences.

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(200),
    signup_date DATE,
    is_active BOOLEAN
);

INSERT INTO customers (customer_id, customer_name, signup_date, is_active)
VALUES
    (1, 'Alice Smith', '2025-01-05', TRUE),
    (2, 'Bob Jones', '2025-01-10', FALSE),
    (3, 'Charlie Brown', '2025-01-12', TRUE);

-- 1. Common SELECT and WHERE
SELECT customer_id, customer_name
FROM customers
WHERE is_active = TRUE;

-- 2. Date filtering pattern common across SQL dialects
SELECT *
FROM customers
WHERE signup_date >= '2025-01-01';

-- 3. Aggregation
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN is_active THEN 1 ELSE 0 END) AS active_customers
FROM customers;

-- 4. Limit pattern varies by dialect: PostgreSQL uses LIMIT
SELECT *
FROM customers
ORDER BY signup_date
LIMIT 2;

-- Cleanup
-- DROP TABLE IF EXISTS customers;
