# Filtering in SQL

## 1. Why filtering matters

Filtering is one of the most important parts of SQL. It helps you reduce the dataset to only the rows that matter.

In real data engineering work, filtering is used for:

- restricting data by date
- selecting active customers only
- removing invalid rows
- isolating failed records
- reading recent transactions from a large table

---

## 2. Basic filtering with WHERE

The `WHERE` clause is used to filter rows before aggregation or final output.

```sql
SELECT *
FROM customers
WHERE city = 'London';
```

This returns only customers located in London.

---

## 3. AND, OR, and NOT

Use `AND` to require multiple conditions.

```sql
SELECT *
FROM orders
WHERE status = 'paid' AND total_amount > 100;
```

Use `OR` when any one of several conditions is acceptable.

```sql
SELECT *
FROM orders
WHERE status = 'paid' OR status = 'pending';
```

Use `NOT` to exclude rows.

```sql
SELECT *
FROM customers
WHERE NOT is_active;
```

---

## 4. IN and NOT IN

`IN` checks whether a value appears in a list.

```sql
SELECT *
FROM customers
WHERE city IN ('London', 'Paris', 'Berlin');
```

`NOT IN` excludes those values.

```sql
SELECT *
FROM customers
WHERE city NOT IN ('London', 'Paris');
```

This is often cleaner than writing many `OR` conditions.

---

## 5. BETWEEN

`BETWEEN` is used for ranges.

```sql
SELECT *
FROM orders
WHERE total_amount BETWEEN 100 AND 500;
```

This includes both endpoints, depending on the database.

Common use cases:

- dates in a range
- amounts in a range
- ages in a range

---

## 6. LIKE and pattern matching

`LIKE` is used for pattern matching with text.

```sql
SELECT *
FROM customers
WHERE first_name LIKE 'A%';
```

This matches names starting with `A`.

Other common patterns:

```sql
LIKE '%son'     -- ends with son
LIKE '_ohn'     -- exactly 4 characters and ends with ohn
LIKE '%ali%'    -- contains ali anywhere
```

This is extremely useful for search and cleanup tasks.

---

## 7. NULL filtering

NULL is special in SQL. It means “unknown” or “missing value”, not zero or an empty string.

Because of this, you must use:

- `IS NULL`
- `IS NOT NULL`

Example:

```sql
SELECT *
FROM customers
WHERE city IS NULL;
```

This is different from:

```sql
WHERE city = NULL
```

which does not work because comparisons to NULL do not evaluate to TRUE.

---

## 8. Three-valued logic

SQL uses three-valued logic:

- TRUE
- FALSE
- UNKNOWN

This is why `NULL` behaves differently from normal values. A condition can evaluate to `UNKNOWN`, and rows are excluded unless explicitly handled.

Example:

```sql
WHERE city = 'London' OR city IS NULL
```

This returns rows that are in London or have no city value.

---

## 9. Common filtering mistakes

Avoid these mistakes:

- comparing a column to `NULL` using `=`
- using `OR` when `IN` would be clearer
- forgetting `IS NULL` when checking missing values
- mixing `WHERE` and `HAVING` without understanding the order of operations

---

## 10. Practical examples

### Example 1: filter by active customers

```sql
SELECT *
FROM customers
WHERE is_active = TRUE;
```

### Example 2: values in a set

```sql
SELECT *
FROM orders
WHERE status IN ('paid', 'shipped');
```

### Example 3: date range

```sql
SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';
```

### Example 4: text pattern

```sql
SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';
```

---

## 11. Key learning goals

By the end of this section, you should be able to:

- use `WHERE` to filter rows
- combine conditions with `AND`, `OR`, and `NOT`
- use `IN`, `NOT IN`, and `BETWEEN`
- use `LIKE` for pattern matching
- correctly handle `NULL` with `IS NULL` and `IS NOT NULL`
- understand how SQL logic differs from normal boolean logic
