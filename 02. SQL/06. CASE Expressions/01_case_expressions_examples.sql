-- CASE Expressions examples
-- Demonstrates conditional logic and category mapping in SQL.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    total_spent DECIMAL(10,2),
    city VARCHAR(50),
    status VARCHAR(30)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO customers (customer_id, first_name, total_spent, city, status)
VALUES
    (1, 'Alice', 1200.00, 'London', 'active'),
    (2, 'Bob', 350.00, NULL, 'inactive'),
    (3, 'Charlie', 80.00, 'Paris', 'active'),
    (4, 'Diana', 600.00, 'Berlin', 'active');

INSERT INTO orders (order_id, customer_id, total_amount, status)
VALUES
    (101, 1, 150.00, 'paid'),
    (102, 1, 220.50, 'paid'),
    (103, 2, 99.99, 'pending'),
    (104, 2, 350.00, 'cancelled'),
    (105, 3, 80.00, 'paid'),
    (106, 4, 480.00, 'shipped'),
    (107, 4, 700.00, 'paid');

-- 1. Basic CASE expression
SELECT
    customer_id,
    first_name,
    total_spent,
    CASE
        WHEN total_spent >= 1000 THEN 'VIP'
        WHEN total_spent >= 500 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customers;

-- 2. CASE with NULL handling
SELECT
    customer_id,
    city,
    CASE
        WHEN city IS NULL THEN 'Unknown'
        ELSE city
    END AS normalized_city
FROM customers;

-- 3. CASE for order size categorization
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount < 100 THEN 'Small'
        WHEN total_amount BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM orders;

-- 4. CASE inside aggregation: conditional counts
SELECT
    COUNT(CASE WHEN status = 'paid' THEN 1 END) AS paid_orders,
    COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_orders,
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled_orders,
    COUNT(*) AS total_orders
FROM orders;

-- 5. CASE inside aggregation: conditional revenue
SELECT
    SUM(CASE WHEN status = 'paid' THEN total_amount ELSE 0 END) AS paid_revenue,
    SUM(CASE WHEN status = 'cancelled' THEN total_amount ELSE 0 END) AS cancelled_revenue,
    SUM(CASE WHEN status IN ('paid', 'shipped') THEN total_amount ELSE 0 END) AS successful_revenue
FROM orders;

-- 6. CASE for business rules
SELECT
    customer_id,
    status,
    CASE
        WHEN status = 'active' AND total_spent >= 500 THEN 'High Value Active'
        WHEN status = 'active' THEN 'Active'
        WHEN status = 'inactive' THEN 'Inactive'
        ELSE 'Unknown'
    END AS customer_segment
FROM customers;

-- 7. Data quality flag example
SELECT
    order_id,
    total_amount,
    status,
    CASE
        WHEN total_amount < 0 THEN 'Invalid amount'
        WHEN status IS NULL THEN 'Missing status'
        ELSE 'Valid'
    END AS data_quality_flag
FROM orders;

-- 8. Recoding raw values into normalized categories
SELECT
    first_name,
    city,
    CASE
        WHEN city = 'London' THEN 'UK'
        WHEN city = 'Paris' THEN 'France'
        WHEN city = 'Berlin' THEN 'Germany'
        WHEN city IS NULL THEN 'Unknown Location'
        ELSE 'Other'
    END AS region
FROM customers;

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
