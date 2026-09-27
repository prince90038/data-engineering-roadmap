# Deduplication in SQL

## 1. Why deduplication matters

Duplicate records can appear in source systems, ETL pipelines, and analytics tables. Deduplication is a core skill in Data Engineering because duplicate rows can distort counts, revenue, and customer metrics.

Examples of duplicate-causing situations:

- repeated source extracts
- late-arriving updates
- multiple event trackers
- merge conflicts
- inconsistent business keys

---

## 2. Types of duplicates

Common duplicate scenarios include:

- exact duplicate rows
- duplicates by business key
- latest-record-per-customer problems
- duplicate transactions across partitions or dates

A clean deduplication strategy depends on the business rule.

---

## 3. Exact duplicates

Exact duplicates are identical rows repeated in the same table.

```sql
SELECT DISTINCT *
FROM customers;
```

This removes identical rows but does not help when duplicates need a latest-record decision.

---

## 4. Deduplicating by business key

A common pattern is keeping only one row per customer, product, or event key.

```sql
WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY updated_at DESC
        ) AS rn
    FROM customers
)
SELECT *
FROM ranked
WHERE rn = 1;
```

This keeps the latest record for each customer.

---

## 5. ROW_NUMBER for deduplication

`ROW_NUMBER()` is one of the most common deduplication tools in SQL.

It works well when:

- you need one record per business key
- a timestamp or sequence column determines which record is newest
- you want to identify duplicates before deleting them

---

## 6. Keep earliest vs latest records

The ordering logic determines which row is retained.

```sql
ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY updated_at DESC
) AS rn
```

This keeps the newest row.

```sql
ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY updated_at ASC
) AS rn
```

This keeps the oldest row.

---

## 7. Deduplication in ETL

In data engineering, deduplication is often part of the pipeline:

1. ingest raw data
2. clean and normalize
3. identify duplicates
4. keep the best row
5. load to curated tables

This ensures downstream data is reliable and consistent.

---

## 8. Data quality checks

Deduplication is also tied to monitoring:

```sql
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
```

This helps identify duplicate business keys before a downstream process.

---

## 9. Common pitfalls

Common mistakes include:

- deduplicating without defining the business key
- relying on `DISTINCT` when a latest-record rule is required
- not checking timestamps or source priority
- dropping records without validating the reason

---

## 10. Key learning goals

By the end of this topic, you should be able to:

- identify duplicate data patterns
- explain how `ROW_NUMBER()` helps with deduplication
- keep the latest or earliest record per key
- write deduplication checks for analytical and ETL workflows

---

## 11. Practice prompts

Try solving:

- keep the latest row per customer
- remove exact duplicates from a staging table
- identify duplicate transactions by order_id
- deduplicate product records by product_code
- keep the first valid record for each person in a source feed

Deduplication is a must-have skill for trustworthy data pipelines and warehouse design.
