-- Data modeling examples
-- OLTP and OLAP-style designs

-- 1. Normalized OLTP-style schema
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    city VARCHAR(100)
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

INSERT INTO customers (customer_id, first_name, last_name, email, city)
VALUES
    (1, 'Alice', 'Smith', 'alice@example.com', 'London'),
    (2, 'Bob', 'Jones', 'bob@example.com', 'Paris');

INSERT INTO products (product_id, product_name, category, price)
VALUES
    (10, 'Laptop', 'Electronics', 900.00),
    (20, 'Desk Chair', 'Furniture', 180.00);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (1001, 1, '2025-01-10'),
    (1002, 2, '2025-01-12');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    (1001, 10, 1),
    (1001, 20, 2),
    (1002, 10, 1);

-- Query the normalized schema
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    p.product_name,
    oi.quantity,
    p.price
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

-- 2. Example warehouse-style star schema
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(200),
    city VARCHAR(100)
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    order_date DATE,
    year_num INT,
    month_num INT
);

CREATE TABLE fact_sales (
    sale_key INT PRIMARY KEY,
    customer_key INT,
    date_key INT,
    product_id INT,
    quantity INT,
    sales_amount DECIMAL(12,2)
);

INSERT INTO dim_customer (customer_key, customer_id, customer_name, city)
VALUES
    (1, 1, 'Alice Smith', 'London'),
    (2, 2, 'Bob Jones', 'Paris');

INSERT INTO dim_date (date_key, order_date, year_num, month_num)
VALUES
    (1, '2025-01-10', 2025, 1),
    (2, '2025-01-12', 2025, 1);

INSERT INTO fact_sales (sale_key, customer_key, date_key, product_id, quantity, sales_amount)
VALUES
    (1, 1, 1, 10, 1, 900.00),
    (2, 1, 1, 20, 2, 360.00),
    (3, 2, 2, 10, 1, 900.00);

SELECT
    dc.customer_name,
    dd.month_num,
    SUM(fs.sales_amount) AS monthly_sales
FROM fact_sales fs
JOIN dim_customer dc
    ON fs.customer_key = dc.customer_key
JOIN dim_date dd
    ON fs.date_key = dd.date_key
GROUP BY dc.customer_name, dd.month_num;

-- Cleanup
-- DROP TABLE IF EXISTS fact_sales;
-- DROP TABLE IF EXISTS dim_date;
-- DROP TABLE IF EXISTS dim_customer;
-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS customers;
