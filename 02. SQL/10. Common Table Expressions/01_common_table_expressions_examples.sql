-- Common Table Expressions examples
-- Covers basic CTEs, multiple CTEs, chained CTEs, and recursive CTEs.

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

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT,
    department_id INT
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris'),
    (3, 'Charlie', 'Berlin'),
    (4, 'Diana', 'Rome'),
    (5, 'Eve', 'Madrid');

INSERT INTO orders (order_id, customer_id, total_amount, order_date)
VALUES
    (101, 1, 150.00, '2025-01-05'),
    (102, 1, 220.50, '2025-01-12'),
    (103, 2, 980.00, '2025-01-20'),
    (104, 3, 450.00, '2025-02-01'),
    (105, 1, 640.00, '2025-02-10'),
    (106, 5, 210.00, '2025-02-15');

INSERT INTO employees (employee_id, employee_name, manager_id, department_id)
VALUES
    (1, 'CEO', NULL, 1),
    (2, 'VP Sales', 1, 1),
    (3, 'Manager A', 2, 2),
    (4, 'Manager B', 2, 2),
    (5, 'Analyst 1', 3, 2),
    (6, 'Analyst 2', 3, 2),
    (7, 'Analyst 3', 4, 2);

-- 1. Basic CTE
WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_spend
WHERE total_spend > 500;

-- 2. Multiple CTEs
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
),
loyal_customers AS (
    SELECT customer_id
    FROM customer_orders
    WHERE order_count >= 2
)
SELECT c.*
FROM customers c
JOIN loyal_customers lc
    ON c.customer_id = lc.customer_id;

-- 3. Chained CTEs with ranking
WITH order_totals AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        total_spend,
        RANK() OVER (ORDER BY total_spend DESC) AS rnk
    FROM order_totals
)
SELECT *
FROM ranked_customers
WHERE rnk <= 3;

-- 4. Recursive CTE for employee hierarchy
WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        manager_id,
        employee_name,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.manager_id,
        e.employee_name,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
      ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;

-- 5. CTE for filtering then final aggregation
WITH filtered_orders AS (
    SELECT *
    FROM orders
    WHERE order_date >= '2025-01-01'
),
customer_summary AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count,
        SUM(total_amount) AS total_spend
    FROM filtered_orders
    GROUP BY customer_id
)
SELECT *
FROM customer_summary
ORDER BY total_spend DESC;

-- Optional cleanup
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
