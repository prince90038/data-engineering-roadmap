-- Advanced Joins examples
-- Covers non-equi joins, multi-column joins, NULL behavior, EXISTS, and anti joins.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE salary_ranges (
    salary_band VARCHAR(20),
    min_salary INT,
    max_salary INT
);

CREATE TABLE sales_data (
    customer_id INT,
    region VARCHAR(20),
    month VARCHAR(10),
    sales_value DECIMAL(10,2)
);

CREATE TABLE target_data (
    customer_id INT,
    region VARCHAR(20),
    month VARCHAR(10),
    sales_target DECIMAL(10,2)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary INT
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris'),
    (3, 'Charlie', 'Berlin'),
    (4, 'Diana', NULL);

INSERT INTO orders (order_id, customer_id, total_amount, order_date)
VALUES
    (101, 1, 150.00, '2025-01-05'),
    (102, 1, 220.50, '2025-01-12'),
    (103, 2, 99.99, '2025-01-20'),
    (104, 5, 320.00, '2025-02-01');

INSERT INTO salary_ranges (salary_band, min_salary, max_salary)
VALUES
    ('Junior', 0, 50000),
    ('Mid', 50001, 90000),
    ('Senior', 90001, 150000);

INSERT INTO sales_data (customer_id, region, month, sales_value)
VALUES
    (1, 'North', 'Jan', 500.00),
    (1, 'North', 'Feb', 700.00),
    (2, 'South', 'Jan', 200.00),
    (3, 'East', 'Jan', 800.00);

INSERT INTO target_data (customer_id, region, month, sales_target)
VALUES
    (1, 'North', 'Jan', 600.00),
    (1, 'North', 'Feb', 650.00),
    (2, 'South', 'Jan', 250.00),
    (5, 'West', 'Jan', 1000.00);

INSERT INTO employees (employee_id, employee_name, salary)
VALUES
    (1, 'Alice Manager', 120000),
    (2, 'Bob Employee', 65000),
    (3, 'Charlie Employee', 45000),
    (4, 'Diana Employee', 95000);

-- 1. Non-equi join: salary band lookup
SELECT
    e.employee_name,
    e.salary,
    s.salary_band
FROM employees e
JOIN salary_ranges s
    ON e.salary BETWEEN s.min_salary AND s.max_salary;

-- 2. Multi-column join
SELECT
    s.customer_id,
    s.region,
    s.month,
    s.sales_value,
    t.sales_target
FROM sales_data s
JOIN target_data t
    ON s.customer_id = t.customer_id
   AND s.region = t.region
   AND s.month = t.month;

-- 3. Join with NULLs: values that are NULL will not match by default
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

-- 4. NULL-safe style using COALESCE
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 5. Semi join using EXISTS
SELECT c.*
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 6. Anti join: customers with no orders
SELECT c.*
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 7. Anti join using NOT EXISTS
SELECT c.*
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 8. Range join example with dates
SELECT
    o.order_id,
    o.order_date,
    CASE
        WHEN o.total_amount < 100 THEN 'Low'
        WHEN o.total_amount BETWEEN 100 AND 300 THEN 'Medium'
        ELSE 'High'
    END AS amount_bucket
FROM orders o;

-- Optional cleanup
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS target_data;
-- DROP TABLE IF EXISTS sales_data;
-- DROP TABLE IF EXISTS salary_ranges;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
