-- Temporary tables example

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris');

INSERT INTO orders (order_id, customer_id, total_amount, order_date)
VALUES
    (101, 1, 150.00, '2025-01-05'),
    (102, 1, 220.50, '2025-01-10'),
    (103, 2, 80.00, '2025-01-12');

-- 1. Create a temporary table to store intermediate grouped results
CREATE TEMP TABLE temp_customer_summary AS
SELECT
    c.customer_id,
    c.first_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spend
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name;

-- 2. Use the temp table in a later query
SELECT *
FROM temp_customer_summary;

-- 3. Add more data to the temp table for staging work
INSERT INTO temp_customer_summary (customer_id, first_name, order_count, total_spend)
VALUES (3, 'Charlie', 1, 310.00);

SELECT *
FROM temp_customer_summary;

-- 4. Drop the temp table when finished
DROP TABLE temp_customer_summary;

-- Cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
