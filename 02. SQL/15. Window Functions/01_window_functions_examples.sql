-- Window functions examples
-- Covers ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, NTILE, and running totals.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    employee_name VARCHAR(100),
    salary INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO employees (employee_id, department_id, employee_name, salary)
VALUES
    (1, 10, 'Alice', 90000),
    (2, 10, 'Bob', 90000),
    (3, 10, 'Charlie', 85000),
    (4, 20, 'Diana', 120000),
    (5, 20, 'Ethan', 120000),
    (6, 20, 'Frank', 95000);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES
    (101, '2025-01-01', 100.00),
    (102, '2025-01-02', 130.00),
    (103, '2025-01-03', 160.00),
    (104, '2025-01-04', 175.00),
    (105, '2025-01-05', 200.00),
    (106, '2025-01-06', 240.00);

-- 1. ROW_NUMBER, RANK, DENSE_RANK
SELECT
    employee_id,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rnk
FROM employees;

-- 2. NTILE for quartile segmentation
SELECT
    employee_id,
    salary,
    NTILE(3) OVER (ORDER BY salary DESC) AS salary_bucket
FROM employees;

-- 3. LAG and LEAD for trend comparison
SELECT
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS previous_day_amount,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_day_amount
FROM orders;

-- 4. Running total
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- 5. Department-level rankings
SELECT
    employee_id,
    department_id,
    employee_name,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;

-- 6. Moving average over last 3 rows
SELECT
    order_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3d
FROM orders;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS employees;
