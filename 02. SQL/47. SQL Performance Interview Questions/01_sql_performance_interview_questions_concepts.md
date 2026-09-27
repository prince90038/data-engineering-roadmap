# SQL Performance Interview Questions

## 1. Why performance questions matter

Performance questions test whether you understand how SQL runs under the hood.

A query may be logically correct but still be too slow because of how the database executes it.

---

## 2. Common topics interviewers ask about

You should be able to discuss:

- why a query is slow
- how indexes help performance
- when indexes do not help
- execution plans
- sequential scans
- hash joins and nested loop joins
- partition pruning
- predicate pushdown
- why `DISTINCT` can be expensive
- why joins can multiply rows unexpectedly
- optimizing queries on large tables

---

## 3. Why queries become slow

Common causes include:

- scanning too much data
- missing indexes on filtering columns
- unnecessary joins
- expensive sorts or aggregations
- repeated work across subqueries
- poor join strategy

---

## 4. Indexes

Indexes speed up access to relevant rows.

However, they are not always good for every query, especially when:

- the table is small
- most rows are returned anyway
- a function is applied to the column
- the index is not selective enough

---

## 5. Execution plans

An execution plan shows the path the database uses to answer a query.

This is critical because it reveals:

- whether there is a full scan
- which join strategy is used
- how sorting or aggregation is performed
- which plan is likely expensive

---

## 6. Join and scan behavior

Examples of common concepts include:

- sequential scan
- index scan
- nested loop join
- hash join
- merge join

Understanding these helps explain why a query is expensive.

---

## 7. Partition pruning and predicate pushdown

These are important performance concepts in large data systems.

Partition pruning limits reads to relevant partitions.

Predicate pushdown filters data earlier in the query path to minimize work.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain why a SQL query can be slow even when it is correct
- describe how indexes affect runtime
- interpret a basic execution plan
- talk about joins, scans, pruning, and filtering strategies
- explain how to optimize a large-table query

---

## 9. Practice prompts

Try solving:

- explain why a filter on a non-indexed column may cause a full scan
- identify whether a nested loop join or hash join is more appropriate
- discuss why `DISTINCT` may be expensive on a large table
- propose changes to speed up a query on a billion-row dataset

Performance questions are about understanding cost, data distribution, and query plan behavior.
