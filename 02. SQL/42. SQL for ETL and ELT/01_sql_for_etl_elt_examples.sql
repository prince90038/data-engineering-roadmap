-- SQL for ETL / ELT examples

CREATE TABLE raw_orders (
    order_id INT,
    customer_name VARCHAR(200),
    product_name VARCHAR(200),
    order_amount DECIMAL(10,2),
    order_date VARCHAR(50)
);

INSERT INTO raw_orders (order_id, customer_name, product_name, order_amount, order_date)
VALUES
    (1, ' Alice Smith ', 'Laptop', 900.00, '2025-01-05'),
    (2, 'alice smith', 'Laptop', 900.00, '2025-01-05'),
    (3, 'Bob Jones', 'Monitor', 320.00, '2025-01-12'),
    (4, 'Charlie Brown', 'Mouse', 25.00, '2025-01-20');

-- 1. Clean and normalize values
SELECT
    order_id,
    TRIM(LOWER(customer_name)) AS clean_customer_name,
    TRIM(product_name) AS clean_product_name,
    CAST(order_amount AS DECIMAL(10,2)) AS order_amount,
    CAST(order_date AS DATE) AS order_date
FROM raw_orders;

-- 2. Remove duplicates using row_number
WITH ranked_orders AS (
    SELECT
        order_id,
        TRIM(LOWER(customer_name)) AS customer_name,
        TRIM(product_name) AS product_name,
        CAST(order_amount AS DECIMAL(10,2)) AS order_amount,
        CAST(order_date AS DATE) AS order_date,
        ROW_NUMBER() OVER (
            PARTITION BY TRIM(LOWER(customer_name)), TRIM(product_name), CAST(order_amount AS DECIMAL(10,2)), CAST(order_date AS DATE)
            ORDER BY order_id
        ) AS row_num
    FROM raw_orders
)
SELECT *
FROM ranked_orders
WHERE row_num = 1;

-- 3. Example transformation into a cleaned target table
CREATE TABLE cleaned_orders AS
SELECT
    order_id,
    TRIM(LOWER(customer_name)) AS customer_name,
    TRIM(product_name) AS product_name,
    CAST(order_amount AS DECIMAL(10,2)) AS order_amount,
    CAST(order_date AS DATE) AS order_date
FROM raw_orders;

SELECT *
FROM cleaned_orders;

-- Cleanup
-- DROP TABLE IF EXISTS cleaned_orders;
-- DROP TABLE IF EXISTS raw_orders;
