-- UPSERT and MERGE examples

CREATE TABLE customers_stage (
    customer_id INT,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    updated_at TIMESTAMP
);

CREATE TABLE customers_target (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    updated_at TIMESTAMP
);

INSERT INTO customers_stage (customer_id, customer_name, city, updated_at)
VALUES
    (1, 'Alice Smith', 'London', '2025-01-05 09:00:00'),
    (2, 'Bob Jones', 'Paris', '2025-01-06 09:00:00'),
    (3, 'Charlie Brown', 'Berlin', '2025-01-07 09:00:00');

INSERT INTO customers_target (customer_id, customer_name, city, updated_at)
VALUES
    (1, 'Alice Smith', 'London', '2025-01-05 09:00:00'),
    (2, 'Bob Jones', 'New York', '2025-01-01 08:00:00');

-- 1. Upsert pattern using MERGE
MERGE INTO customers_target t
USING customers_stage s
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
FROM customers_target;

-- 2. PostgreSQL-style UPSERT using ON CONFLICT
INSERT INTO customers_target (customer_id, customer_name, city, updated_at)
VALUES (3, 'Charlie Brown', 'Berlin', '2025-01-07 09:00:00')
ON CONFLICT (customer_id)
DO UPDATE SET
    customer_name = EXCLUDED.customer_name,
    city = EXCLUDED.city,
    updated_at = EXCLUDED.updated_at;

SELECT *
FROM customers_target;

-- Cleanup
-- DROP TABLE IF EXISTS customers_target;
-- DROP TABLE IF EXISTS customers_stage;
