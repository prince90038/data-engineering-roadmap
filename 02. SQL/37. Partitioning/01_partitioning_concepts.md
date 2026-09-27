# Partitioning in SQL

## 1. What is partitioning?

Partitioning divides a table into smaller, more manageable pieces.

This can improve query performance, simplify maintenance, and support large-scale data workloads.

---

## 2. Why partitioning matters

Partitioning is especially useful for large tables where scanning the whole dataset is expensive.

It can help by:

- reducing the amount of data examined per query
- improving maintenance operations
- supporting practical storage management
- enabling partition pruning

---

## 3. Horizontal partitioning

Horizontal partitioning splits rows across multiple partitions based on a key.

Examples:

- by date range
- by customer region
- by hash value
- by list of values

This is the most common form of partitioning in data warehouses and large OLAP systems.

---

## 4. Range partitioning

Range partitioning stores rows in partitions based on a value range.

Example:

```text
2025-01 to 2025-03
2025-04 to 2025-06
```

This is common for time-based data.

---

## 5. List partitioning

List partitioning groups rows by a set of discrete values.

Example:

```text
region = 'us-east'
region = 'eu-west'
```

---

## 6. Hash partitioning

Hash partitioning distributes rows based on a hash of a key.

This helps spread data evenly across partitions and reduces hot spots.

---

## 7. Partition pruning

Partition pruning is when the database reads only relevant partitions instead of the whole table.

This can dramatically improve performance for queries with filters on partition keys.

---

## 8. Trade-offs

Partitioning can improve performance, but it adds complexity.

It can make operations like:

- archival
- maintenance
- data retention
- index design

more involved.

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain the purpose of partitioning
- differentiate horizontal, range, list, and hash partitioning
- understand partition pruning
- describe why partitioning is useful in large data systems

---

## 10. Practice prompts

Try solving:

- design a partitioning strategy for daily sales data
- explain why date-based partitioning is useful
- compare range and hash partitioning for a large customer table
- explain how partition pruning helps a query run faster

Partitioning is a key concept for building scalable SQL data systems.
