-- Isolation levels examples
-- Illustrates the concept of transaction consistency and concurrency behavior.

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock INT
);

INSERT INTO inventory (product_id, stock)
VALUES
    (1, 10),
    (2, 20);

-- Example of a simple transaction in default isolation
BEGIN;
SELECT * FROM inventory WHERE product_id = 1;
UPDATE inventory SET stock = stock - 2 WHERE product_id = 1;
COMMIT;

-- Example of setting transaction isolation (syntax varies by database)
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Typical read consistency pattern
SELECT *
FROM inventory
WHERE stock < 20;

-- Optional cleanup
-- DROP TABLE IF EXISTS inventory;
