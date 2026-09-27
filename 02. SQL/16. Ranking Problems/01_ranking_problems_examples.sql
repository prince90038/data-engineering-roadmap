-- Ranking problems examples
-- Covers ROW_NUMBER, RANK, DENSE_RANK, and NTILE.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    employee_name VARCHAR(100),
    salary INT
);

INSERT INTO employees (employee_id, department_id, employee_name, salary)
VALUES
    (1, 10, 'Alice', 90000),
    (2, 10, 'Bob', 90000),
    (3, 10, 'Charlie', 85000),
    (4, 20, 'Diana', 120000),
    (5, 20, 'Ethan', 120000),
    (6, 20, 'Frank', 95000),
    (7, 30, 'Grace', 70000),
    (8, 30, 'Henry', 72000);

-- 1. ROW_NUMBER per department
SELECT
    employee_id,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_row_num
FROM employees;

-- 2. RANK and DENSE_RANK with ties
SELECT
    employee_id,
    department_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

-- 3. Top 2 employees per department
WITH ranked AS (
    SELECT
        employee_id,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 2;

-- 4. Second highest salary overall
WITH ranked AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT salary
FROM ranked
WHERE rnk = 2;

-- 5. NTILE for quartiles
SELECT
    employee_id,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- Optional cleanup
-- DROP TABLE IF EXISTS employees;
