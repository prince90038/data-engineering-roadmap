-- Incremental ETL project example

CREATE TABLE source_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    last_updated TIMESTAMP
);

CREATE TABLE target_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    last_updated TIMESTAMP
);

INSERT INTO source_orders (order_id, customer_id, order_date, total_amount, last_updated)
VALUES
    (1, 101, '2025-01-05', 120.00, '2025-01-05 10:00:00'),
    (2, 102, '2025-01-06', 80.50, '2025-01-06 10:00:00'),
    (3, 103, '2025-01-07', 210.75, '2025-01-07 10:00:00');

INSERT INTO target_orders (order_id, customer_id, order_date, total_amount, last_updated)
VALUES
    (1, 101, '2025-01-05', 120.00, '2025-01-05 10:00:00');

-- 1. Find rows to load incrementally
SELECT s.*
FROM source_orders s
LEFT JOIN target_orders t
    ON s.order_id = t.order_id
WHERE t.order_id IS NULL
   OR s.last_updated > t.last_updated;

-- 2. MERGE incremental changes
MERGE INTO target_orders t
USING source_orders s
ON t.order_id = s.order_id
WHEN MATCHED THEN
    UPDATE SET
        customer_id = s.customer_id,
        order_date = s.order_date,
        total_amount = s.total_amount,
        last_updated = s.last_updated
WHEN NOT MATCHED THEN
    INSERT (order_id, customer_id, order_date, total_amount, last_updated)
    VALUES (s.order_id, s.customer_id, s.order_date, s.total_amount, s.last_updated);

SELECT *
FROM target_orders;

-- Cleanup
-- DROP TABLE IF EXISTS target_orders;
-- DROP TABLE IF EXISTS source_orders;
