-- Data lakes and SQL examples

-- Example: raw CSV-like data stored in a lake
CREATE TABLE raw_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    product_name VARCHAR(200)
);

INSERT INTO raw_orders (order_id, customer_id, order_date, total_amount, product_name)
VALUES
    (1, 101, '2025-01-05', 150.00, 'Laptop'),
    (2, 102, '2025-01-10', 90.50, 'Mouse'),
    (3, 103, '2025-01-12', 420.00, 'Monitor');

-- Example SQL query over data lake-style raw data
SELECT
    product_name,
    COUNT(*) AS order_count,
    SUM(total_amount) AS revenue
FROM raw_orders
GROUP BY product_name;

-- Example: filtering on a raw lake view
SELECT *
FROM raw_orders
WHERE order_date >= '2025-01-01';

-- Example: combine raw data with a cleaned dimension-like table
CREATE TABLE dim_product (
    product_name VARCHAR(200) PRIMARY KEY,
    category VARCHAR(100)
);

INSERT INTO dim_product (product_name, category)
VALUES
    ('Laptop', 'Electronics'),
    ('Mouse', 'Accessories'),
    ('Monitor', 'Electronics');

SELECT
    r.product_name,
    d.category,
    SUM(r.total_amount) AS revenue
FROM raw_orders r
JOIN dim_product d
    ON r.product_name = d.product_name
GROUP BY r.product_name, d.category;

-- Cleanup
-- DROP TABLE IF EXISTS dim_product;
-- DROP TABLE IF EXISTS raw_orders;
