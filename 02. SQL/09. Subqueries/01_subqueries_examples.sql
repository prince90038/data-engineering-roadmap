-- Subqueries examples
-- Covers scalar subqueries, correlated subqueries, IN, EXISTS, and subqueries in FROM.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO customers (customer_id, first_name, city)
VALUES
    (1, 'Alice', 'London'),
    (2, 'Bob', 'Paris'),
    (3, 'Charlie', 'Berlin'),
    (4, 'Diana', 'Rome'),
    (5, 'Eve', 'Madrid');

INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'Anna', 10, 60000),
    (2, 'Ben', 10, 75000),
    (3, 'Cora', 20, 82000),
    (4, 'David', 20, 91000),
    (5, 'Ella', 30, 70000);

INSERT INTO orders (order_id, customer_id, employee_id, total_amount, order_date)
VALUES
    (101, 1, 1, 150.00, '2025-01-05'),
    (102, 1, 2, 220.50, '2025-01-12'),
    (103, 2, 3, 980.00, '2025-01-20'),
    (104, 3, 2, 450.00, '2025-02-01'),
    (105, 1, 3, 640.00, '2025-02-10'),
    (106, 5, 5, 210.00, '2025-02-15');

INSERT INTO products (product_id, product_name, category, unit_price)
VALUES
    (1, 'Laptop', 'Electronics', 1200.00),
    (2, 'Keyboard', 'Accessories', 85.00),
    (3, 'Monitor', 'Electronics', 350.00),
    (4, 'Desk Chair', 'Furniture', 220.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
    (1, 101, 1, 1),
    (2, 101, 2, 2),
    (3, 102, 3, 1),
    (4, 103, 1, 1),
    (5, 103, 4, 2),
    (6, 104, 2, 5),
    (7, 105, 3, 2),
    (8, 106, 2, 3);

-- 1. Scalar subquery in SELECT
SELECT
    c.customer_id,
    c.first_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS total_orders
FROM customers c;

-- 2. Single-row subquery in WHERE
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 3. Multi-row subquery with IN
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- 4. Multi-row subquery with NOT IN
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

-- 5. Correlated subquery using EXISTS
SELECT c.customer_id,
       c.first_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.total_amount > 500
);

-- 6. Correlated subquery using NOT EXISTS
SELECT c.customer_id,
       c.first_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 7. Subquery in WHERE using comparison
SELECT *
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = 10
);

-- 8. Subquery in FROM (derived table)
SELECT *
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) order_summary
WHERE order_count > 1;

-- 9. Subquery used to find products in high-volume orders
SELECT p.product_id,
       p.product_name
FROM products p
WHERE p.product_id IN (
    SELECT oi.product_id
    FROM order_items oi
    GROUP BY oi.product_id
    HAVING SUM(oi.quantity) > 3
);

-- 10. Subquery with aggregate and outer-filter logic
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    (
        SELECT AVG(salary)
        FROM employees
        WHERE department_id = e.department_id
    ) AS dept_avg_salary
FROM employees e;

-- Optional cleanup
-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
-- DROP TABLE IF EXISTS employees;
