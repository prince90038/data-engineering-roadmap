# Advanced Joins in SQL

## 1. Why advanced joins matter

Basic joins are used to connect two tables with a common key. Advanced joins go further by handling cases such as:

- range-based comparisons
- multi-column matching
- NULL-aware joins
- anti-joins and semi-joins
- conditional matching
- existence checks

These patterns are common in analytics, data quality work, and complex ETL pipelines.

---

## 2. Equi joins

An equi join is the most common type of join. It matches rows where one column equals another column.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
```

This is a standard join and is often used for transaction and dimension data.

---

## 3. Non-equi joins

A non-equi join matches values using comparison operators instead of equality.

```sql
SELECT
    e.employee_id,
    e.salary,
    s.salary_band
FROM employees e
JOIN salary_ranges s
    ON e.salary BETWEEN s.min_salary AND s.max_salary;
```

This is useful for bucketing values into ranges without using `CASE` for every row.

---

## 4. Range joins

A range join matches values in a range, such as dates or score intervals.

```sql
SELECT
    t.transaction_id,
    t.transaction_date,
    p.period_name
FROM transactions t
JOIN reporting_periods p
    ON t.transaction_date BETWEEN p.start_date AND p.end_date;
```

This is common in reporting and time-based analysis.

---

## 5. Multi-column joins

A multi-column join matches on more than one column.

```sql
SELECT
    a.customer_id,
    a.region,
    a.month,
    b.sales_target
FROM sales_data a
JOIN target_data b
    ON a.customer_id = b.customer_id
   AND a.region = b.region
   AND a.month = b.month;
```

This is useful when a single key is not enough to uniquely identify records.

---

## 6. Joins involving NULLs

NULL values do not match other NULL values in SQL joins because NULL is treated as unknown.

```sql
SELECT
    a.id,
    a.value,
    b.id,
    b.value
FROM table_a a
LEFT JOIN table_b b
    ON a.value = b.value;
```

If `a.value` or `b.value` is NULL, the match may fail unless you explicitly handle it.

A common workaround is:

```sql
SELECT
    a.id,
    b.id
FROM table_a a
LEFT JOIN table_b b
    ON COALESCE(a.value, 'UNKNOWN') = COALESCE(b.value, 'UNKNOWN');
```

---

## 7. Semi joins

A semi join returns rows from the left table when at least one matching row exists in the right table.

```sql
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

This is useful when you want to check whether related data exists, without duplicating rows.

---

## 8. Anti joins

An anti join returns rows from the left table that do not have a match in the right table.

```sql
SELECT c.*
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

This helps answer questions like:

- customers without orders
- products never sold
- employees with no department

---

## 9. EXISTS and NOT EXISTS

`EXISTS` is often used as a cleaner alternative to some joins.

```sql
SELECT c.*
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

```sql
SELECT c.*
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

These are especially useful for filtering based on whether related records exist.

---

## 10. Anti-patterns and pitfalls

Some advanced join patterns can produce unexpected results:

- non-equi conditions can return many matches
- joining on NULL values can silently exclude rows
- multi-column joins can create duplicates if keys are not unique
- cross joins without a filter can explode the row count
- anti joins can hide rows if the business key logic is wrong

---

## 11. Real-world use cases

Advanced joins are especially common in:

- customer-retention analysis
- time-window comparisons
- price banding and score ranges
- data quality checks
- missing-reference detection
- near-real-time enrichment

Examples:

- customer orders within a date range
- discount rules based on order value
- customers with no recent transaction
- records whose email or ID is missing from a reference table

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- explain equi joins and non-equi joins
- understand range joins and multi-column joins
- handle NULL comparisons carefully
- use `EXISTS` and anti-joins for missing-record logic
- know when a join creates unexpected row multiplication

---

## 13. Practice prompts

Try using advanced joins to answer:

- customers with no orders in the last 90 days
- employees whose salary falls in a specific compensation band
- products that were never sold
- records that match across multiple business keys
- orders whose date falls within a reporting period

These are common in data quality, reporting, and analytics pipelines.
