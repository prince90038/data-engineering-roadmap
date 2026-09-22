-- Joins examples
-- Demonstrates INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN, and SELF JOIN.

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

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT NULL
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

INSERT INTO products (product_id, product_name, price)
VALUES
    (10, 'Laptop', 1200.00),
    (11, 'Mouse', 35.00),
    (12, 'Keyboard', 70.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
    (1, 101, 10, 1),
    (2, 101, 11, 2),
    (3, 102, 12, 1),
    (4, 104, 10, 1);

INSERT INTO employees (employee_id, employee_name, manager_id)
VALUES
    (1, 'Alice Manager', NULL),
    (2, 'Bob Employee', 1),
    (3, 'Charlie Employee', 1),
    (4, 'Diana Employee', 2);

-- 1. INNER JOIN
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

-- 2. LEFT JOIN
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

-- 3. RIGHT JOIN
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;

-- 4. FULL OUTER JOIN
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;

-- 5. Finding customers without orders
SELECT
    c.customer_id,
    c.first_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 6. Finding orders without a matching customer
SELECT
    o.order_id,
    o.customer_id,
    o.total_amount
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 7. CROSS JOIN
SELECT
    c.customer_id,
    p.product_id,
    p.product_name
FROM customers c
CROSS JOIN products p;

-- 8. SELF JOIN to show manager relationship
SELECT
    e.employee_name,
    m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;

-- 9. Multiple joins example
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    p.product_name,
    oi.quantity
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

-- Optional cleanup
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
