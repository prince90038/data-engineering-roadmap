# Parquet and Columnar Storage

## 1. What is row-based storage?

Row-based storage stores data one row at a time.

This is useful for transactional systems where operations often read or write full records.

Example:

```text
row 1 -> [id, name, city, amount]
row 2 -> [id, name, city, amount]
```

---

## 2. What is columnar storage?

Columnar storage stores data by column rather than by row.

This is effective for analytical workloads because queries often access a small number of columns across many rows.

Example:

```text
id column: [1, 2, 3, 4]
name column: ['A', 'B', 'C', 'D']
amount column: [100, 200, 300, 400]
```

---

## 3. Why Parquet matters

Parquet is a popular columnar file format optimized for analytical workloads.

It supports:

- efficient compression
- predicate pushdown
- column pruning
- better scan performance for filtered analytical queries

---

## 4. Compression

Columnar storage often compresses data very effectively because similar values are grouped together.

This reduces storage footprint and I/O during reads.

---

## 5. Predicate pushdown

Predicate pushdown means filtering data as early as possible, often at the storage layer.

This reduces the amount of data read from disk or object storage before computation begins.

---

## 6. Column pruning

Column pruning means selecting only the needed columns from the file instead of reading whole rows.

This is especially valuable in analytics, where queries often access only a few columns from huge datasets.

---

## 7. Parquet vs CSV

CSV is easy to read and share, but it is row-based and relatively inefficient for large analytical queries.

Parquet is typically much better suited for large-scale reporting and data engineering workloads due to:

- compression
- columnar scan efficiency
- metadata support
- better compatibility with distributed SQL engines

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between row and columnar storage
- describe why columnar formats are better for analytics
- understand compression, predicate pushdown, and column pruning
- explain why Parquet is often preferred to CSV for analytical workloads

---

## 9. Practice prompts

Try solving:

- explain why a query that selects only two columns is faster on Parquet than CSV
- identify when row-based storage is still useful
- describe how predicate pushdown reduces query cost
- compare Parquet and CSV for warehouse and lake workloads

Parquet is one of the most important file formats for analytical SQL and data engineering pipelines.
