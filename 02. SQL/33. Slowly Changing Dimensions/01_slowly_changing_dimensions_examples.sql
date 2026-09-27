-- Slowly Changing Dimensions (SCD) Type 2 example

CREATE TABLE dim_customer_scd (
    customer_surr_key INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    effective_from DATE,
    effective_to DATE,
    is_current BOOLEAN
);

-- Initial customer state
INSERT INTO dim_customer_scd (customer_surr_key, customer_id, customer_name, city, effective_from, effective_to, is_current)
VALUES
    (1, 101, 'Alice Smith', 'London', '2024-01-01', '2025-01-15', FALSE),
    (2, 101, 'Alice Smith', 'Paris', '2025-01-16', NULL, TRUE);

-- New customer record after city change
INSERT INTO dim_customer_scd (customer_surr_key, customer_id, customer_name, city, effective_from, effective_to, is_current)
VALUES
    (3, 101, 'Alice Smith', 'Berlin', '2025-02-01', NULL, TRUE);

-- Query the active version as of a specific date
SELECT *
FROM dim_customer_scd
WHERE customer_id = 101
  AND effective_from <= '2025-01-20'
  AND (effective_to IS NULL OR effective_to >= '2025-01-20');

-- Compare historic versions
SELECT customer_id, customer_name, city, effective_from, effective_to, is_current
FROM dim_customer_scd
WHERE customer_id = 101
ORDER BY effective_from;

-- Cleanup
-- DROP TABLE IF EXISTS dim_customer_scd;
