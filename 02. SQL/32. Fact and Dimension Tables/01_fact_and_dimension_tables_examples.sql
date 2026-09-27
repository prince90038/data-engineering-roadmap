-- Fact and dimension table examples

CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id INT UNIQUE,
    customer_name VARCHAR(200),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_id INT UNIQUE,
    product_name VARCHAR(200),
    category VARCHAR(100)
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    order_date DATE,
    year_num INT,
    month_num INT,
    quarter_num INT
);

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    sales_amount DECIMAL(12,2),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

INSERT INTO dim_customer (customer_key, customer_id, customer_name, city)
VALUES
    (1, 101, 'Alice Smith', 'London'),
    (2, 102, 'Bob Jones', 'Paris');

INSERT INTO dim_product (product_key, product_id, product_name, category)
VALUES
    (1, 5001, 'Laptop', 'Electronics'),
    (2, 5002, 'Desk Chair', 'Furniture');

INSERT INTO dim_date (date_key, order_date, year_num, month_num, quarter_num)
VALUES
    (1, '2025-01-05', 2025, 1, 1),
    (2, '2025-01-20', 2025, 1, 1);

INSERT INTO fact_sales (sale_id, customer_key, product_key, date_key, quantity, sales_amount)
VALUES
    (1, 1, 1, 1, 1, 900.00),
    (2, 2, 2, 2, 3, 540.00),
    (3, 1, 2, 2, 2, 360.00);

-- Query the star schema
SELECT
    dc.customer_name,
    dp.product_name,
    dd.month_num,
    SUM(fs.sales_amount) AS total_sales
FROM fact_sales fs
JOIN dim_customer dc
    ON fs.customer_key = dc.customer_key
JOIN dim_product dp
    ON fs.product_key = dp.product_key
JOIN dim_date dd
    ON fs.date_key = dd.date_key
GROUP BY dc.customer_name, dp.product_name, dd.month_num
ORDER BY dd.month_num;

-- Cleanup
-- DROP TABLE IF EXISTS fact_sales;
-- DROP TABLE IF EXISTS dim_date;
-- DROP TABLE IF EXISTS dim_product;
-- DROP TABLE IF EXISTS dim_customer;
