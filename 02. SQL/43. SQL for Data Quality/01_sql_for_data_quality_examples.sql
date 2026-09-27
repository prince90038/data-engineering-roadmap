-- SQL for data quality examples

CREATE TABLE customer_data (
    customer_id INT,
    customer_name VARCHAR(200),
    signup_date DATE,
    city VARCHAR(100)
);

INSERT INTO customer_data (customer_id, customer_name, signup_date, city)
VALUES
    (1, 'Alice Smith', '2025-01-05', 'London'),
    (2, 'Bob Jones', NULL, 'Paris'),
    (2, 'Bob Jones', NULL, 'Paris'),
    (3, 'Charlie Brown', '2025-02-01', NULL),
    (4, NULL, '2025-02-02', 'Berlin');

-- 1. Null check on required fields
SELECT 'missing_signup_date' AS check_name,
       COUNT(*) AS failed_count
FROM customer_data
WHERE signup_date IS NULL;

-- 2. Duplicate check on customer_id
SELECT 'duplicate_customer_id' AS check_name,
       COUNT(*) AS failed_count
FROM (
    SELECT customer_id
    FROM customer_data
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) dup;

-- 3. Null check on customer_name or city
SELECT 'missing_required_values' AS check_name,
       COUNT(*) AS failed_count
FROM customer_data
WHERE customer_name IS NULL OR city IS NULL;

-- 4. Row count check
SELECT 'row_count_check' AS check_name,
       COUNT(*) AS failed_count
FROM customer_data
WHERE customer_id IS NULL;

-- Cleanup
-- DROP TABLE IF EXISTS customer_data;
