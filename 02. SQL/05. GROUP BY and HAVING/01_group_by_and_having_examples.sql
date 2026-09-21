-- GROUP BY and HAVING examples
-- Demonstrates grouping rows and filtering grouped results.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    category VARCHAR(50)
);

INSERT INTO customers (customer_id, first_name, last_name, city)
VALUES
    (1, 'Alice', 'Johnson', 'London'),
    (2, 'Bob', 'Smith', 'Paris'),
    (3, 'Charlie', 'Brown', 'London'),
    (4, 'Diana', 'Lee', 'Berlin');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status, category)
VALUES
    (101, 1, '2025-01-05', 150.00, 'paid', 'electronics'),
    (102, 1, '2025-01-12', 220.50, 'paid', 'books'),
    (103, 2, '2025-01-20', 99.99, 'pending', 'books'),
    (104, 2, '2025-02-01', 350.00, 'shipped', 'electronics'),
    (105, 3, '2025-02-14', 80.00, 'paid', 'home'),
    (106, 4, '2025-02-18', 480.00, 'cancelled', 'electronics'),
    (107, 1, '2025-02-25', 120.00, 'paid', 'home'),
    (108, 3, '2025-03-03', 210.00, 'paid', 'books');

-- 1. Basic GROUP BY: order count per customer
SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- 2. GROUP BY with aggregate calculations
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_spent,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 3. GROUP BY by date
SELECT
    DATE(order_date) AS order_day,
    SUM(total_amount) AS daily_revenue,
    COUNT(*) AS order_count
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

-- 4. WHERE before GROUP BY
SELECT
    category,
    COUNT(*) AS category_order_count,
    SUM(total_amount) AS category_revenue
FROM orders
WHERE status = 'paid'
GROUP BY category
ORDER BY category_revenue DESC;

-- 5. HAVING after GROUP BY
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY total_spent DESC;

-- 6. HAVING with aggregate filter
SELECT
    category,
    AVG(total_amount) AS avg_amount
FROM orders
GROUP BY category
HAVING AVG(total_amount) > 150
ORDER BY avg_amount DESC;

-- 7. Multiple columns in GROUP BY
SELECT
    customer_id,
    DATE(order_date) AS order_day,
    COUNT(*) AS orders_on_day
FROM orders
GROUP BY customer_id, DATE(order_date)
ORDER BY customer_id, order_day;

-- 8. Grouping with a join example
SELECT
    c.city,
    COUNT(*) AS order_count,
    SUM(o.total_amount) AS city_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;

-- 9. Customers with more than N total spend
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 300
ORDER BY total_spent DESC;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
