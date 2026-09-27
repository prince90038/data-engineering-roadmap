-- Transactions and ACID examples
-- Covers BEGIN, COMMIT, ROLLBACK, and SAVEPOINT.

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(100),
    balance DECIMAL(10,2)
);

INSERT INTO accounts (account_id, account_name, balance)
VALUES
    (1, 'Alice', 500.00),
    (2, 'Bob', 250.00);

-- 1. Simple transfer transaction
BEGIN;

UPDATE accounts
SET balance = balance - 100.00
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 100.00
WHERE account_id = 2;

COMMIT;

-- 2. Rollback example
BEGIN;

UPDATE accounts
SET balance = balance - 50.00
WHERE account_id = 1;

ROLLBACK;

-- 3. Savepoint example
BEGIN;

UPDATE accounts
SET balance = balance - 30.00
WHERE account_id = 1;

SAVEPOINT before_second_update;

UPDATE accounts
SET balance = balance + 30.00
WHERE account_id = 2;

ROLLBACK TO SAVEPOINT before_second_update;

COMMIT;

-- Check final balances after operations
SELECT * FROM accounts;

-- Optional cleanup
-- DROP TABLE IF EXISTS accounts;
