-- Data engineering SQL interview questions examples

CREATE TABLE sales_source (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    last_updated TIMESTAMP
);

CREATE TABLE sales_target (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    last_updated TIMESTAMP
);

INSERT INTO sales_source (order_id, customer_id, order_date, amount, last_updated)
VALUES
    (1, 101, '2025-01-05', 120.00, '2025-01-05 09:00:00'),
    (2, 102, '2025-01-06', 80.50, '2025-01-06 09:00:00'),
    (3, 103, '2025-01-07', 220.00, '2025-01-07 09:00:00');

INSERT INTO sales_target (order_id, customer_id, order_date, amount, last_updated)
VALUES
    (1, 101, '2025-01-05', 120.00, '2025-01-05 09:00:00');

-- 1. Incremental sync using a watermark
SELECT s.*
FROM sales_source s
LEFT JOIN sales_target t
    ON s.order_id = t.order_id
WHERE t.order_id IS NULL
   OR s.last_updated > t.last_updated;

-- 2. Upsert logic to keep target updated
MERGE INTO sales_target t
USING sales_source s
ON t.order_id = s.order_id
WHEN MATCHED THEN
    UPDATE SET
        customer_id = s.customer_id,
        order_date = s.order_date,
        amount = s.amount,
        last_updated = s.last_updated
WHEN NOT MATCHED THEN
    INSERT (order_id, customer_id, order_date, amount, last_updated)
    VALUES (s.order_id, s.customer_id, s.order_date, s.amount, s.last_updated);

SELECT *
FROM sales_target;

-- 3. Duplicate check before final insert
SELECT order_id, COUNT(*) AS duplicate_count
FROM sales_source
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Cleanup
-- DROP TABLE IF EXISTS sales_target;
-- DROP TABLE IF EXISTS sales_source;
