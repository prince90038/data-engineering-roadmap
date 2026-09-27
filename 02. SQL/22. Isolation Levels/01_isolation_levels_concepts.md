# Isolation Levels in SQL

## 1. What is isolation?

Isolation defines how transaction behavior is isolated from other concurrent transactions.

This is important because multiple users or processes may read and write data at the same time.

---

## 2. Why isolation matters

In busy systems, multiple transactions can overlap. Without proper isolation, you may get:

- dirty reads
- non-repeatable reads
- phantom reads
- lost updates

These problems can produce inconsistent analysis and unreliable application behavior.

---

## 3. Read Uncommitted

This is the lowest isolation level.

A transaction can read data that another transaction has changed but not committed yet.

This can lead to dirty reads.

```sql
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
```

This is rarely desirable for production systems.

---

## 4. Read Committed

This is the default in many databases.

A transaction only sees committed data.

It prevents dirty reads, but a value can change between reads.

```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

---

## 5. Repeatable Read

This ensures that if a transaction reads a row multiple times, it sees the same result each time.

It prevents non-repeatable reads.

```sql
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
```

---

## 6. Serializable

This is the strongest isolation level.

It provides the most strict guarantee but usually has the highest locking and concurrency cost.

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

This helps prevent abnormal concurrent anomalies but may reduce throughput.

---

## 7. Dirty reads, non-repeatable reads, and phantom reads

Dirty read:

- reads uncommitted changes

Non-repeatable read:

- reads the same row and gets a different value during the same transaction

Phantom read:

- a query in the same transaction sees extra rows appearing or disappearing between reads

---

## 8. Trade-offs

Higher isolation levels improve consistency but can reduce concurrency and increase lock waits.

Lower isolation levels improve performance and concurrency but allow more inconsistent reads.

Production databases carefully choose the right balance based on business requirements.

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- name the main isolation levels
- explain dirty reads and phantom reads
- describe the trade-offs between consistency and concurrency
- choose the right context for different transaction requirements

---

## 10. Practice prompts

Try solving:

- explain the difference between `READ COMMITTED` and `SERIALIZABLE`
- describe a scenario that causes a phantom read
- identify why `REPEATABLE READ` might be useful for reporting
- explain why concurrency can cause inconsistent analytics without proper isolation

Isolation is a core concept for reliable multi-user database systems.
