-- Parquet and columnar storage examples

CREATE TABLE sales_row_store (
    sale_id INT,
    customer_id INT,
    product_name VARCHAR(200),
    region VARCHAR(50),
    sales_amount DECIMAL(12,2),
    sale_date DATE
);

INSERT INTO sales_row_store (sale_id, customer_id, product_name, region, sales_amount, sale_date)
VALUES
    (1, 101, 'Laptop', 'us-east', 900.00, '2025-01-15'),
    (2, 102, 'Mouse', 'eu-west', 25.00, '2025-01-16'),
    (3, 101, 'Monitor', 'us-east', 320.00, '2025-01-18'),
    (4, 103, 'Laptop', 'ap-south', 950.00, '2025-01-20');

-- Typical analytical query using selective filtering
SELECT
    product_name,
    SUM(sales_amount) AS total_revenue
FROM sales_row_store
WHERE region = 'us-east'
GROUP BY product_name;

-- Only selected columns are used for analysis
SELECT sale_date, sales_amount
FROM sales_row_store
WHERE sales_amount > 300;

-- A columnar-friendly aggregation pattern
SELECT
    region,
    COUNT(*) AS total_orders,
    SUM(sales_amount) AS region_revenue
FROM sales_row_store
GROUP BY region;

-- Cleanup
-- DROP TABLE IF EXISTS sales_row_store;
