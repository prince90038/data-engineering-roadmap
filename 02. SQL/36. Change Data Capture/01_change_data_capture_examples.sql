-- Change Data Capture examples

CREATE TABLE source_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    updated_at TIMESTAMP
);

CREATE TABLE target_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    updated_at TIMESTAMP
);

INSERT INTO source_customers (customer_id, customer_name, city, updated_at)
VALUES
    (1, 'Alice Smith', 'London', '2025-01-05 10:00:00'),
    (2, 'Bob Jones', 'Paris', '2025-01-06 10:00:00');

INSERT INTO target_customers (customer_id, customer_name, city, updated_at)
VALUES
    (1, 'Alice Smith', 'London', '2025-01-05 10:00:00');

-- 1. Insert new rows from source that are newer than the last sync
SELECT s.*
FROM source_customers s
LEFT JOIN target_customers t
    ON s.customer_id = t.customer_id
WHERE t.customer_id IS NULL;

-- 2. Update changed rows using CDC-like logic
SELECT s.*
FROM source_customers s
JOIN target_customers t
    ON s.customer_id = t.customer_id
WHERE s.updated_at > t.updated_at;

-- 3. Simulate CDC by inserting new rows and updating changed rows
INSERT INTO source_customers (customer_id, customer_name, city, updated_at)
VALUES (3, 'Charlie Brown', 'Berlin', '2025-01-08 09:00:00');

UPDATE source_customers
SET city = 'Rome', updated_at = '2025-01-09 09:00:00'
WHERE customer_id = 2;

-- 4. Merge new or changed rows
MERGE INTO target_customers t
USING source_customers s
ON t.customer_id = s.customer_id
WHEN MATCHED THEN
    UPDATE SET
        customer_name = s.customer_name,
        city = s.city,
        updated_at = s.updated_at
WHEN NOT MATCHED THEN
    INSERT (customer_id, customer_name, city, updated_at)
    VALUES (s.customer_id, s.customer_name, s.city, s.updated_at);

SELECT *
FROM target_customers;

-- Cleanup
-- DROP TABLE IF EXISTS target_customers;
-- DROP TABLE IF EXISTS source_customers;
