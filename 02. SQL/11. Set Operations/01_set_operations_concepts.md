# Set Operations in SQL

## 1. What are set operations?

Set operations combine result sets from multiple `SELECT` statements.

The main SQL set operators are:

- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT`

These are useful when you need to compare or combine data from different tables or queries.

---

## 2. UNION

`UNION` combines result sets and removes duplicates.

```sql
SELECT customer_id
FROM orders_2024
UNION
SELECT customer_id
FROM orders_2025;
```

This returns each customer only once, even if they appear in both result sets.

Use `UNION` when you want a unique list.

---

## 3. UNION ALL

`UNION ALL` combines result sets and keeps duplicates.

```sql
SELECT customer_id
FROM orders_2024
UNION ALL
SELECT customer_id
FROM orders_2025;
```

This is generally faster than `UNION` because it does not sort or deduplicate.

Use `UNION ALL` when duplicates are expected or not important.

---

## 4. INTERSECT

`INTERSECT` returns only rows that appear in both result sets.

```sql
SELECT customer_id
FROM orders_2024
INTERSECT
SELECT customer_id
FROM orders_2025;
```

This is useful for identifying overlap between two datasets.

---

## 5. EXCEPT

`EXCEPT` returns rows from the first result set that are not in the second result set.

```sql
SELECT customer_id
FROM orders_2024
EXCEPT
SELECT customer_id
FROM orders_2025;
```

This helps answer questions like: Which customers bought in 2024 but not in 2025?

---

## 6. Column compatibility rules

Set operators require compatibility between the two `SELECT` statements:

- same number of columns
- compatible data types
- same order of columns
- logical matching of meaning

If the columns do not line up, the query may fail or produce confusing results.

---

## 7. Duplicate handling

The biggest difference between `UNION` and `UNION ALL` is duplicate handling.

```sql
UNION      -- removes duplicates
UNION ALL  -- keeps duplicates
```

This matters when doing data checks, historical comparisons, or reconciling source and target datasets.

---

## 8. Performance differences

`UNION ALL` is usually cheaper than `UNION` because it avoids deduplication work.

`UNION` may require:

- sorting
- hashing
- duplicate elimination

This can be expensive on large datasets.

---

## 9. Common use cases

Set operations are useful for:

- comparing year-over-year data
- combining daily partitions
- finding overlapping customers or products
- finding missing rows between datasets
- building consistent staging layers in ETL pipelines

Examples:

- `UNION ALL` to append monthly sales snapshots
- `INTERSECT` to find customers present in both source tables
- `EXCEPT` to identify records missing from the target table

---

## 10. Set operations vs joins

A `JOIN` combines columns from related tables by rows.

A set operation combines result sets from two or more queries.

Use a join when you want:

- related records side by side
- columns from multiple tables
- relational matching

Use a set operation when you want:

- combine or compare result sets
- remove or keep duplicates
- find overlap or differences across queries

---

## 11. Practical examples

```sql
SELECT customer_id, order_total
FROM sales_2024
UNION ALL
SELECT customer_id, order_total
FROM sales_2025;
```

```sql
SELECT customer_id
FROM sales_2024
INTERSECT
SELECT customer_id
FROM sales_2025;
```

```sql
SELECT customer_id
FROM sales_2024
EXCEPT
SELECT customer_id
FROM sales_2025;
```

These patterns are very common in warehouse and reporting workloads.

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- explain `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT`
- know when to remove duplicates and when not to
- understand set compatibility requirements
- compare joins and set operations
- use set operations in ETL and reporting workflows

---

## 13. Practice prompts

Try answering:

- which customers bought in both 2024 and 2025?
- which customers bought in 2024 but not 2025?
- what are the combined sales rows without duplicates?
- how many records are duplicated when using `UNION ALL`?
- how do set operations differ from a join in a reporting query?

These are common SQL interview and analytics questions.
