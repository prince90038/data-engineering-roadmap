# Query Execution Plans in SQL

## 1. What is an execution plan?

An execution plan is the sequence of steps the database uses to run a query.

It shows how the database chooses to:

- scan tables
- use indexes
- join tables
- sort data
- aggregate values
- filter rows

Understanding execution plans is one of the most valuable SQL performance skills.

---

## 2. Why execution plans matter

A query may look correct but still be slow because of how the engine executes it.

Execution plans help answer questions like:

- Is the database scanning the entire table?
- Is it using the proper index?
- Is the join algorithm expensive?
- Is sorting or hashing causing the slowdown?

---

## 3. Common plan operators

Some common operators include:

- Seq Scan / Sequential Scan
- Index Scan
- Index Only Scan
- Nested Loop Join
- Hash Join
- Merge Join
- Sort
- Aggregate

Each operator tells you how the engine is working internally.

---

## 4. Sequential scan

A sequential scan reads the entire table.

This is not always bad, especially when the table is small or the query reads a large portion of it.

But on large tables, scanning the whole dataset can be slow.

---

## 5. Index scan

An index scan uses an index to narrow the search quickly.

This is often much faster than scanning every row when the query is selective.

---

## 6. Nested loop join

A nested loop join is often efficient when one side of the join is small.

```text
for each row in small table
    find matching row in large table
```

This works well in certain lookup-heavy workloads.

---

## 7. Hash join

A hash join builds a hash table for one side of the join and matches the other side to it.

This is often efficient for larger joins when indexes are not ideal.

---

## 8. Merge join

A merge join requires both inputs to be sorted by the join key.

It can be very efficient when the data is already ordered and the join is large.

---

## 9. Sort and aggregate operators

Sort and aggregate operators are often expensive.

A large sort can dominate query time, especially if the database must sort large intermediate result sets before grouping or filtering.

---

## 10. EXPLAIN and EXPLAIN ANALYZE

```sql
EXPLAIN SELECT *
FROM orders
WHERE customer_id = 42;
```

```sql
EXPLAIN ANALYZE SELECT *
FROM orders
WHERE customer_id = 42;
```

`EXPLAIN ANALYZE` shows the actual runtime behavior, which is much more useful than just the estimated plan.

---

## 11. Reading an execution plan

When reading a plan, ask:

- Are large scans happening?
- Is the database avoiding the index?
- Are joins using expensive algorithms?
- Is there a lot of sorting?
- Is the plan matching the query’s size and shape?

This is the foundation of query tuning.

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- explain what an execution plan is
- identify common plan operators
- read a basic `EXPLAIN` output
- understand why a query might be slow even when it is logically correct

---

## 13. Practice prompts

Try solving:

- explain why a query that filters by `customer_id` may still do a sequential scan
- compare the likely plan for a join on a large table with and without an index
- identify when a sort or hash join is likely the bottleneck
- use `EXPLAIN ANALYZE` on a slow query and interpret the result

Execution plans are essential for identifying database performance issues in real systems.
