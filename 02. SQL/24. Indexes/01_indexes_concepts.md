# Indexes in SQL

## 1. What is an index?

An index is a database structure that speeds up data retrieval by helping the database find rows more efficiently.

Without an index, a query may need to scan the entire table to find matching rows.

---

## 2. Why indexes matter

Indexes are crucial for performance when tables are large.

They help with queries like:

- filtering on a column
- sorting large result sets
- joining large tables
- looking up rows by key

---

## 3. B-tree indexes

The most common index type is the B-tree index.

```sql
CREATE INDEX idx_customers_city
ON customers(city);
```

This helps when the database often filters by `city`.

---

## 4. Composite indexes

A composite index contains multiple columns.

```sql
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);
```

This is useful when queries filter by both columns together.

---

## 5. Unique indexes

A unique index enforces uniqueness.

```sql
CREATE UNIQUE INDEX idx_unique_email
ON users(email);
```

This is similar to a `UNIQUE` constraint but can be created independently.

---

## 6. Covering indexes

A covering index contains all columns needed by a query, reducing the need to read the base table.

This can improve performance significantly for read-heavy workloads.

---

## 7. Index write overhead

Indexes speed up reads, but they add overhead to writes.

Each `INSERT`, `UPDATE`, or `DELETE` may require updating the index.

This is why too many indexes can slow down a database.

---

## 8. When indexes help

Indexes are useful when:

- a column is frequently filtered
- a table is large
- joins on a key are common
- sorting is frequent

---

## 9. When indexes do not help

Indexes may not help when:

- the table is very small
- the query reads most of the table anyway
- a function is applied to the indexed column
- the query pattern does not match the index definition

---

## 10. Query planning and execution plans

Indexes are only effective when the database chooses to use them.

This is why understanding `EXPLAIN` and execution plans matters.

---

## 11. Key learning goals

By the end of this topic, you should be able to:

- explain what an index is
- explain why indexes improve query performance
- identify different index types
- describe trade-offs between read performance and write cost

---

## 12. Practice prompts

Try solving:

- add an index to a city column used in filtering
- create a composite index for `customer_id` and `order_date`
- explain why a query might still be slow even after adding an index
- compare the speed implications of having too many indexes

Indexes are one of the most important performance tools in SQL.
