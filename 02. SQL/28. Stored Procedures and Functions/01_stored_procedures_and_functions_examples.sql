-- Stored procedures and functions examples
-- PostgreSQL-style syntax shown here.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    total_spend DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, first_name, total_spend)
VALUES
    (1, 'Alice', 0),
    (2, 'Bob', 0);

-- 1. A reusable function that computes a customer's total spend
CREATE OR REPLACE FUNCTION calculate_customer_total(p_customer_id INT)
RETURNS DECIMAL(12,2)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        SELECT COALESCE(SUM(total_amount), 0)
        FROM orders
        WHERE customer_id = p_customer_id
    );
END;
$$;

-- 2. Query the function
SELECT customer_id, first_name, calculate_customer_total(customer_id) AS total_spend
FROM customers;

-- 3. A stored procedure that inserts an order and updates customer total spend
CREATE OR REPLACE PROCEDURE add_order_for_customer(
    p_customer_id INT,
    p_order_id INT,
    p_amount DECIMAL(10,2),
    p_order_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO orders (order_id, customer_id, total_amount, order_date)
    VALUES (p_order_id, p_customer_id, p_amount, p_order_date);

    UPDATE customers
    SET total_spend = total_spend + p_amount
    WHERE customer_id = p_customer_id;
END;
$$;

-- 4. Call the procedure
CALL add_order_for_customer(1, 201, 125.50, '2025-01-15');
CALL add_order_for_customer(2, 202, 99.99, '2025-01-18');

-- 5. Check the resulting values
SELECT *
FROM customers;

SELECT *
FROM orders;

-- Cleanup
-- DROP PROCEDURE IF EXISTS add_order_for_customer(INT, INT, DECIMAL, DATE);
-- DROP FUNCTION IF EXISTS calculate_customer_total(INT);
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
