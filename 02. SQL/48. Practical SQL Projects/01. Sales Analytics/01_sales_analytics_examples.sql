-- Sales Analytics project example

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(200),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, signup_date)
VALUES
    (1, 'Alice', '2024-01-05'),
    (2, 'Bob', '2024-02-10'),
    (3, 'Charlie', '2024-03-01');

INSERT INTO products (product_id, product_name, category, price)
VALUES
    (10, 'Laptop', 'Electronics', 900.00),
    (20, 'Mouse', 'Accessories', 25.00),
    (30, 'Desk Chair', 'Furniture', 180.00);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (101, 1, '2025-01-10'),
    (102, 2, '2025-01-15'),
    (103, 1, '2025-02-01');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    (101, 10, 1),
    (101, 20, 2),
    (102, 30, 1),
    (103, 10, 1),
    (103, 20, 3);

-- 1. Total revenue
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;

-- 2. Monthly sales
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;

-- 3. Top customers by spend
SELECT
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_spend
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spend DESC;

-- 4. Top products by revenue
SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 5. Average order value
SELECT AVG(order_value) AS average_order_value
FROM (
    SELECT o.order_id, SUM(p.price * oi.quantity) AS order_value
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.order_id
) x;

-- Cleanup
-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS customers;
