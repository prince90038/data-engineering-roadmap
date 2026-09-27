-- Important SQL interview problems examples

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(200),
    department_id INT,
    salary INT
);

INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'Alice', 10, 90000),
    (2, 'Bob', 10, 80000),
    (3, 'Charlie', 20, 95000),
    (4, 'Diana', 20, 75000),
    (5, 'Eve', 20, 95000),
    (6, 'Frank', NULL, 70000);

-- 1. Second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- 2. Employees earning more than department average
SELECT e.employee_name, e.department_id, e.salary
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
) d
    ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

-- 3. Top 3 salaries per department
SELECT employee_name, department_id, salary
FROM (
    SELECT
        e.*,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees e
) ranked
WHERE rn <= 3;

-- 4. Duplicate record check
SELECT employee_name, COUNT(*) AS duplicate_count
FROM employees
GROUP BY employee_name
HAVING COUNT(*) > 1;

-- Cleanup
-- DROP TABLE IF EXISTS employees;
