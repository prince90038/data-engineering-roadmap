-- SQL Data Types examples
-- Demonstrates common SQL data types and how they are used in tables and queries.

-- 1. Create a table with multiple data types
CREATE TABLE sales_records (
    sale_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    is_paid BOOLEAN DEFAULT FALSE,
    sale_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metadata JSON
);

-- 2. Insert rows with different data types
INSERT INTO sales_records (
    sale_id,
    customer_id,
    product_name,
    quantity,
    unit_price,
    total_amount,
    is_paid,
    sale_date,
    metadata
)
VALUES
    (1001, 1, 'Laptop', 2, 999.99, 1999.98, TRUE, '2025-01-10', '{"color":"silver","warranty":"2 years"}'),
    (1002, 2, 'Mouse', 5, 19.99, 99.95, FALSE, '2025-01-12', '{"color":"black","wireless":true}'),
    (1003, 3, 'Keyboard', 1, 89.50, 89.50, TRUE, '2025-01-15', '{"layout":"US","mechanical":true}');

-- 3. Select rows with numeric and string columns
SELECT sale_id, product_name, quantity, unit_price, total_amount
FROM sales_records;

-- 4. Filter numeric values
SELECT *
FROM sales_records
WHERE total_amount > 100;

-- 5. Use date and boolean filters
SELECT *
FROM sales_records
WHERE sale_date >= '2025-01-12'
  AND is_paid = TRUE;

-- 6. Cast values to different types
SELECT
    sale_id,
    CAST(unit_price AS VARCHAR(20)) AS unit_price_text,
    CAST(sale_date AS VARCHAR(20)) AS sale_date_text
FROM sales_records;

-- 7. Use NULL values with data types
INSERT INTO sales_records (
    sale_id,
    customer_id,
    product_name,
    quantity,
    unit_price,
    total_amount,
    is_paid,
    sale_date,
    metadata
)
VALUES
    (1004, 4, 'Monitor', NULL, NULL, NULL, NULL, NULL, NULL);

SELECT *
FROM sales_records
WHERE sale_date IS NULL;

-- 8. Handle missing values using COALESCE
SELECT
    sale_id,
    product_name,
    COALESCE(quantity, 0) AS quantity_or_zero,
    COALESCE(total_amount, 0) AS total_or_zero
FROM sales_records;

-- 9. Query JSON field values (database-specific syntax varies)
-- PostgreSQL example:
SELECT
    sale_id,
    metadata ->> 'color' AS color,
    metadata ->> 'warranty' AS warranty
FROM sales_records
WHERE metadata IS NOT NULL;

-- 10. Use DECIMAL for money and exact precision
SELECT
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value
FROM sales_records;

-- 11. Use VARCHAR for strings and check length
SELECT
    sale_id,
    product_name,
    LENGTH(product_name) AS name_length
FROM sales_records;

-- 12. Example of a date range query
SELECT *
FROM sales_records
WHERE sale_date BETWEEN '2025-01-10' AND '2025-01-15';

-- 13. Example of checking for boolean values
SELECT *
FROM sales_records
WHERE is_paid = TRUE;

-- 14. Clean up if needed
-- DROP TABLE IF EXISTS sales_records;
