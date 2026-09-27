-- Deduplication examples
-- Covers exact duplicates and latest-record-per-key rules using ROW_NUMBER.

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    updated_at TIMESTAMP
);

INSERT INTO customers (customer_id, customer_name, email, updated_at)
VALUES
    (1, 'Alice', 'alice@example.com', '2025-01-01 09:00:00'),
    (1, 'Alice Updated', 'alice@example.com', '2025-02-01 10:00:00'),
    (2, 'Bob', 'bob@example.com', '2025-01-02 07:00:00'),
    (2, 'Bob', 'bob@example.com', '2025-01-02 07:00:00'),
    (3, 'Charlie', 'charlie@example.com', '2025-02-12 14:00:00'),
    (3, 'Charlie', 'charlie_new@example.com', '2025-02-15 16:00:00');

-- 1. Find exact duplicates
SELECT customer_id, customer_name, email, updated_at, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id, customer_name, email, updated_at
HAVING COUNT(*) > 1;

-- 2. Remove duplicates by keeping the latest record per customer
WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY updated_at DESC
        ) AS rn
    FROM customers
)
SELECT *
FROM ranked
WHERE rn = 1;

-- 3. Deduplicate by DISTINCT for exact duplicates
SELECT DISTINCT *
FROM customers;

-- 4. Find customers with more than one row
SELECT customer_id, COUNT(*) AS row_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Optional cleanup
-- DROP TABLE IF EXISTS customers;
