# NULL Handling in SQL

## 1. What is NULL?

`NULL` means "unknown" or "missing". It is not the same as `0` or an empty string.

This is one of the most important concepts in SQL because it affects:

- filters
- joins
- aggregations
- comparisons
- data quality checks

---

## 2. Three-valued logic

SQL uses three-valued logic:

- TRUE
- FALSE
- UNKNOWN

When a condition involves `NULL`, the result is often `UNKNOWN`, not `TRUE`.

Example:

```sql
WHERE column = NULL
```

This does not work as expected because `NULL` is not equal to anything, even itself.

The correct comparison is:

```sql
WHERE column IS NULL
```

---

## 3. Why NULL = NULL is not true

In SQL, `NULL` is treated as unknown, so the expression:

```sql
NULL = NULL
```

does not evaluate to TRUE.

This is why SQL uses operators like:

- `IS NULL`
- `IS NOT NULL`
- `COALESCE()`
- `NULLIF()`

---

## 4. IS NULL and IS NOT NULL

Use `IS NULL` to check missing values.

```sql
SELECT *
FROM customers
WHERE city IS NULL;
```

Use `IS NOT NULL` to exclude missing values.

```sql
SELECT *
FROM customers
WHERE city IS NOT NULL;
```

This is essential for data cleaning and data validation.

---

## 5. COALESCE

`COALESCE()` returns the first non-NULL value in a list.

```sql
SELECT
    customer_id,
    COALESCE(city, 'Unknown City') AS city
FROM customers;
```

This is extremely common when replacing missing values with a default value.

---

## 6. NULLIF

`NULLIF(value1, value2)` returns `NULL` when both values are equal; otherwise it returns `value1`.

```sql
SELECT NULLIF(100, 100); -- returns NULL
```

This is useful for avoiding divide-by-zero style logic and for normalizing edge cases.

---

## 7. NULLs in aggregates

Aggregates ignore `NULL` values by default, with some important exceptions.

```sql
SELECT AVG(salary) FROM employees;
```

If `salary` contains `NULL`, those rows are ignored.

But this is different from counting rows:

```sql
SELECT COUNT(*)
FROM employees;
```

This counts all rows, including rows with NULL values.

```sql
SELECT COUNT(salary)
FROM employees;
```

This counts only non-NULL salary values.

---

## 8. NULLs in joins

`NULL` values do not match other `NULL` values in normal SQL joins.

```sql
SELECT a.id, b.id
FROM table_a a
LEFT JOIN table_b b
    ON a.value = b.value;
```

If a value is `NULL`, the join does not consider it equal to another `NULL` unless you handle it explicitly.

---

## 9. CASE and NULL logic

You often need to explicitly test for NULL.

```sql
SELECT
    customer_id,
    CASE
        WHEN city IS NULL THEN 'Missing city'
        ELSE city
    END AS city_status
FROM customers;
```

This is useful in data quality rules and transformations.

---

## 10. Data quality examples

NULL handling is critical for:

- missing customer names
- missing product codes
- bad date fields
- incomplete customer records
- invalid warehouse IDs

Common checks include:

- null count by column
- % of missing values
- records where required values are NULL
- missing foreign keys in joins

---

## 11. Practical patterns

```sql
SELECT *
FROM customers
WHERE first_name IS NULL;
```

```sql
SELECT COALESCE(email, 'unknown@example.com')
FROM customers;
```

```sql
SELECT COALESCE(salary, 0) AS salary_cleaned
FROM employees;
```

```sql
SELECT COUNT(*) - COUNT(phone_number) AS missing_phone_numbers
FROM customers;
```

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- explain what `NULL` means in SQL
- use `IS NULL` and `IS NOT NULL` correctly
- avoid misuse of `=` with `NULL`
- use `COALESCE` and `NULLIF` in real queries
- explain how `NULL` affects joins and aggregations
- write SQL data quality checks around missing values

---

## 13. Practice prompts

Try solving:

- count rows where a required field is NULL
- replace NULL values with a default label
- calculate the number of missing customer emails
- compare records with and without missing values
- check how a LEFT JOIN behaves when the join key is NULL

NULL handling is one of the most important skills for real-world data engineering and SQL quality work.
