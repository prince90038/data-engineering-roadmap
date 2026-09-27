-- Set operations examples
-- Covers UNION, UNION ALL, INTERSECT, and EXCEPT.

CREATE TABLE sales_2024 (
    customer_id INT,
    order_total DECIMAL(10,2)
);

CREATE TABLE sales_2025 (
    customer_id INT,
    order_total DECIMAL(10,2)
);

INSERT INTO sales_2024 (customer_id, order_total)
VALUES
    (1, 150.00),
    (2, 220.50),
    (3, 99.99),
    (2, 220.50),
    (4, 345.00);

INSERT INTO sales_2025 (customer_id, order_total)
VALUES
    (2, 220.50),
    (3, 99.99),
    (5, 410.00),
    (6, 120.00),
    (6, 120.00);

-- 1. UNION removes duplicates
SELECT customer_id
FROM sales_2024
UNION
SELECT customer_id
FROM sales_2025;

-- 2. UNION ALL keeps duplicates
SELECT customer_id
FROM sales_2024
UNION ALL
SELECT customer_id
FROM sales_2025;

-- 3. INTERSECT returns customers in both sets
SELECT customer_id
FROM sales_2024
INTERSECT
SELECT customer_id
FROM sales_2025;

-- 4. EXCEPT returns customers only in the first set
SELECT customer_id
FROM sales_2024
EXCEPT
SELECT customer_id
FROM sales_2025;

-- 5. Combine all order totals from both years, keeping all rows
SELECT customer_id, order_total
FROM sales_2024
UNION ALL
SELECT customer_id, order_total
FROM sales_2025;

-- 6. Example using EXCEPT to find missing customers in 2025
SELECT customer_id
FROM sales_2024
EXCEPT
SELECT customer_id
FROM sales_2025
ORDER BY customer_id;

-- Optional cleanup
-- DROP TABLE IF EXISTS sales_2025;
-- DROP TABLE IF EXISTS sales_2024;
