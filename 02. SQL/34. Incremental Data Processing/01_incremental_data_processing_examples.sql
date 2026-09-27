-- Incremental data processing example

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
    (2, 102, '2025-01-06', 90.50, '2025-01-06 11:00:00'),
    (3, 101, '2025-01-08', 220.00, '2025-01-08 12:30:00');

INSERT INTO target_orders (order_id, customer_id, order_date, total_amount, last_updated)
VALUES
    (1, 101, '2025-01-05', 120.00, '2025-01-05 10:00:00');

-- Example incremental load using a watermark
SELECT *
FROM source_orders s
WHERE s.last_updated > '2025-01-05 10:00:00';

-- Upsert new or changed rows
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
