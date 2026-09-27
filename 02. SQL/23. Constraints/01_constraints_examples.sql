-- Constraints examples
-- Covers PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, and DEFAULT.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    status VARCHAR(20) DEFAULT 'active'
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) CHECK (total_amount > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, email)
VALUES
    (1, 'alice@example.com'),
    (2, 'bob@example.com');

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 150.00),
    (102, 2, 245.50);

-- Example of invalid INSERT (will fail if constraint is enforced):
-- INSERT INTO orders (order_id, customer_id, total_amount)
-- VALUES (103, 99, -20.00);

-- Example of duplicate email (will fail):
-- INSERT INTO customers (customer_id, email)
-- VALUES (3, 'alice@example.com');

-- Optional cleanup
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
