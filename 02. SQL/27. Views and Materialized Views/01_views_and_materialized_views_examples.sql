-- Views and materialized views examples

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, first_name, last_name, city)
VALUES
    (1, 'Alice', 'Smith', 'London'),
    (2, 'Bob', 'Jones', 'Paris'),
    (3, 'Charlie', 'Brown', 'Berlin');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2025-01-05', 150.00),
    (102, 1, '2025-01-10', 200.75),
    (103, 2, '2025-01-12', 80.00),
    (104, 3, '2025-02-01', 420.00);

-- 1. Create a view for reusable reporting logic
CREATE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spend
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 2. Query the view
SELECT *
FROM customer_order_summary;

-- 3. Create a materialized view for a precomputed summary
CREATE MATERIALIZED VIEW customer_order_summary_mv AS
SELECT
    c.customer_id,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spend
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.city;

-- 4. Query the materialized view
SELECT *
FROM customer_order_summary_mv;

-- 5. Insert new data and refresh the materialized view
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (105, 2, '2025-02-15', 95.50);

REFRESH MATERIALIZED VIEW customer_order_summary_mv;

SELECT *
FROM customer_order_summary_mv;

-- Cleanup
-- DROP MATERIALIZED VIEW IF EXISTS customer_order_summary_mv;
-- DROP VIEW IF EXISTS customer_order_summary;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
