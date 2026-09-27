-- SCD Type 2 project example

CREATE TABLE dim_customer_scd (
    customer_surr_key INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(200),
    city VARCHAR(100),
    status VARCHAR(50),
    effective_from DATE,
    effective_to DATE,
    is_current BOOLEAN
);

INSERT INTO dim_customer_scd (customer_surr_key, customer_id, customer_name, city, status, effective_from, effective_to, is_current)
VALUES
    (1, 101, 'Alice Smith', 'London', 'active', '2024-01-01', '2025-01-15', FALSE),
    (2, 101, 'Alice Smith', 'Paris', 'active', '2025-01-16', NULL, TRUE);

-- Query the active row for a date
SELECT *
FROM dim_customer_scd
WHERE customer_id = 101
  AND effective_from <= '2025-02-01'
  AND (effective_to IS NULL OR effective_to >= '2025-02-01');

-- View historical versions
SELECT customer_id, city, status, effective_from, effective_to, is_current
FROM dim_customer_scd
WHERE customer_id = 101
ORDER BY effective_from;

-- Cleanup
-- DROP TABLE IF EXISTS dim_customer_scd;
