# Transactions and ACID in SQL

## 1. What is a transaction?

A transaction is a sequence of database operations that are treated as a single unit of work.

Example:

```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

If something fails before the final commit, the transaction can be rolled back.

---

## 2. ACID properties

Transactions are expected to follow ACID rules:

- Atomicity: all or nothing
- Consistency: data remains valid after the transaction
- Isolation: transactions are protected from each other
- Durability: committed changes persist even if the system fails

These properties are essential for reliable data systems.

---

## 3. BEGIN, COMMIT, and ROLLBACK

```sql
BEGIN;
INSERT INTO orders (order_id, customer_id, amount)
VALUES (1001, 42, 250.00);

COMMIT;
```

If there is an error:

```sql
BEGIN;
UPDATE customers SET status = 'inactive' WHERE id = 42;
ROLLBACK;
```

This reverts uncommitted changes.

---

## 4. Savepoints

A savepoint lets you roll back part of a transaction instead of the entire transaction.

```sql
BEGIN;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
SAVEPOINT before_second_update;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
ROLLBACK TO SAVEPOINT before_second_update;
COMMIT;
```

This is useful when you want more control during longer operations.

---

## 5. Why transactions matter in data engineering

Transactions matter when:

- moving money between accounts
- updating dimension tables
- loading data into staging tables
- ensuring all parts of a pipeline succeed together
- preventing partial writes in ETL jobs

---

## 6. Common transaction mistakes

Examples of bad practices:

- committing after each row insert in a multi-step workflow
- forgetting to rollback on failure
- assuming a partial write will be recovered automatically
- mixing business logic with incomplete transaction boundaries

---

## 7. Isolation levels

Isolation controls how transactions interact with each other.

Common levels:

- Read Uncommitted
- Read Committed
- Repeatable Read
- Serializable

Higher isolation levels generally reduce concurrency but increase locking and overhead.

---

## 8. Dirty reads and phantom reads

A dirty read occurs when a transaction reads uncommitted data from another transaction.

A phantom read occurs when rows appear or disappear between reads in the same transaction.

These are part of why isolation levels matter.

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain ACID principles
- write a basic transaction block
- use `COMMIT` and `ROLLBACK` correctly
- understand savepoints
- explain why isolation levels matter

---

## 10. Practice prompts

Try solving:

- transfer money between two accounts in one transaction
- simulate a failed transaction and rollback
- compare isolation behavior across multiple sessions
- describe what happens when a transaction fails after one statement succeeds

Transactions are essential for reliable database behavior in production systems.
