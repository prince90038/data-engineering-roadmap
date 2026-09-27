-- NULL handling examples
-- Covers IS NULL, COALESCE, NULLIF, COUNT, and conditional logic.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary INT,
    manager_id INT
);

INSERT INTO customers (customer_id, first_name, email, city)
VALUES
    (1, 'Alice', 'alice@example.com', 'London'),
    (2, 'Bob', NULL, 'Paris'),
    (3, NULL, 'charlie@example.com', NULL),
    (4, 'Diana', NULL, 'Rome');

INSERT INTO employees (employee_id, employee_name, salary, manager_id)
VALUES
    (1, 'CEO', 95000, NULL),
    (2, 'Manager A', 78000, 1),
    (3, 'Manager B', NULL, 1),
    (4, 'Analyst', 65000, 2),
    (5, 'Analyst 2', NULL, 2);

-- 1. Find rows with NULL values
SELECT *
FROM customers
WHERE city IS NULL;

-- 2. Find rows without NULLs
SELECT *
FROM customers
WHERE email IS NOT NULL;

-- 3. Replace NULL values with defaults
SELECT
    customer_id,
    first_name,
    COALESCE(email, 'no-email@example.com') AS email,
    COALESCE(city, 'Unknown City') AS city
FROM customers;

-- 4. Using NULLIF to avoid a value being treated as null
SELECT
    customer_id,
    NULLIF(first_name, 'Unknown') AS normalized_name
FROM customers;

-- 5. Count NULLs and non-NULLs
SELECT
    COUNT(*) AS total_rows,
    COUNT(email) AS non_null_emails,
    COUNT(*) - COUNT(email) AS missing_emails
FROM customers;

-- 6. NULL handling in aggregates
SELECT
    AVG(COALESCE(salary, 0)) AS avg_salary_with_default,
    AVG(salary) AS avg_salary_ignoring_nulls,
    COUNT(salary) AS employees_with_salary
FROM employees;

-- 7. CASE expression for data-quality labeling
SELECT
    customer_id,
    CASE
        WHEN email IS NULL THEN 'Missing email'
        ELSE 'Valid email'
    END AS email_status,
    CASE
        WHEN city IS NULL THEN 'Missing city'
        ELSE city
    END AS city_status
FROM customers;

-- 8. Demonstrate that NULL = NULL is not true
SELECT
    customer_id,
    first_name,
    city,
    CASE
        WHEN city = city THEN 'Equal'
        ELSE 'Not Equal'
    END AS compare_result
FROM customers;

-- 9. Join example where NULL does not match NULL
SELECT
    c.customer_id,
    c.first_name,
    e.employee_id,
    e.employee_name
FROM customers c
LEFT JOIN employees e
    ON c.customer_id = e.employee_id;

-- Optional cleanup
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS customers;
