-- Indexes examples
-- Covers CREATE INDEX and index design ideas for filters and joins.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    city VARCHAR(100),
    email VARCHAR(200)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, first_name, city, email)
VALUES
    (1, 'Alice', 'London', 'alice@example.com'),
    (2, 'Bob', 'Paris', 'bob@example.com'),
    (3, 'Charlie', 'Berlin', 'charlie@example.com'),
    (4, 'Diana', 'Rome', 'diana@example.com');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2025-01-05', 150.00),
    (102, 1, '2025-01-12', 220.50),
    (103, 2, '2025-01-20', 99.99),
    (104, 3, '2025-02-01', 450.00);

-- 1. Index on a frequently filtered column
CREATE INDEX idx_customers_city ON customers(city);

-- 2. Composite index for join/filter patterns
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);

-- 3. Unique index for email
CREATE UNIQUE INDEX idx_customers_email ON customers(email);

-- Example query that benefits from the indexes
SELECT *
FROM customers
WHERE city = 'London';

SELECT *
FROM orders
WHERE customer_id = 1
  AND order_date >= '2025-01-01';

-- Optional cleanup
-- DROP INDEX IF EXISTS idx_customers_city;
-- DROP INDEX IF EXISTS idx_orders_customer_date;
-- DROP INDEX IF EXISTS idx_customers_email;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
