# CASE Expressions in SQL

## 1. Why CASE expressions matter

A `CASE` expression allows you to apply conditional logic inside a query.

It is one of the most useful SQL features for:

- categorizing values
- converting raw data into business labels
- building reports
- creating conditional aggregation
- writing data quality checks
- implementing business rules

In data engineering, `CASE` is often used to map values into clean categories before loading data into downstream tables.

---

## 2. Basic CASE syntax

The basic structure is:

```sql
CASE
    WHEN condition THEN result
    ELSE result
END
```

Example:

```sql
SELECT
    customer_id,
    CASE
        WHEN total_spent >= 500 THEN 'VIP'
        WHEN total_spent >= 200 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customers;
```

This returns a category based on the value of `total_spent`.

---

## 3. Simple conditional logic

You can classify records based on numeric or text conditions.

```sql
SELECT
    product_id,
    price,
    CASE
        WHEN price >= 1000 THEN 'Premium'
        WHEN price >= 500 THEN 'Standard'
        ELSE 'Budget'
    END AS price_bucket
FROM products;
```

This is often used in reporting and segmentation.

---

## 4. CASE with NULLs

`CASE` can also handle missing or null values.

```sql
SELECT
    customer_id,
    city,
    CASE
        WHEN city IS NULL THEN 'Unknown'
        ELSE city
    END AS customer_city
FROM customers;
```

This is useful for cleaning null values before downstream processing.

---

## 5. CASE inside aggregate queries

A very common use case is conditional aggregation.

```sql
SELECT
    COUNT(CASE WHEN status = 'paid' THEN 1 END) AS paid_orders,
    COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_orders
FROM orders;
```

This calculates counts by condition in a single query.

Another common pattern is:

```sql
SELECT
    SUM(CASE WHEN status = 'paid' THEN total_amount ELSE 0 END) AS paid_revenue,
    SUM(CASE WHEN status = 'cancelled' THEN total_amount ELSE 0 END) AS cancelled_revenue
FROM orders;
```

---

## 6. CASE for categorization

Use `CASE` to define custom buckets.

```sql
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount < 100 THEN 'Small'
        WHEN total_amount BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM orders;
```

This helps turn raw values into easier-to-read business categories.

---

## 7. CASE in SELECT vs WHERE

`CASE` is typically used in the `SELECT` list or in aggregation logic.

It is not the same as a filter condition in `WHERE`.

For example:

```sql
SELECT *
FROM orders
WHERE status = 'paid';
```

This filters rows directly, while:

```sql
SELECT
    order_id,
    CASE
        WHEN status = 'paid' THEN 'Completed'
        ELSE 'Not Completed'
    END AS order_status_label
FROM orders;
```

adds a label without filtering the rows.

---

## 8. Multiple WHEN conditions

You can test multiple conditions in sequence.

```sql
SELECT
    employee_id,
    salary,
    CASE
        WHEN salary >= 150000 THEN 'Executive'
        WHEN salary >= 100000 THEN 'Senior'
        WHEN salary >= 60000 THEN 'Mid'
        ELSE 'Junior'
    END AS salary_band
FROM employees;
```

The first condition that evaluates to TRUE wins.

---

## 9. CASE with data transformation

`CASE` is useful when standardizing data values.

```sql
SELECT
    customer_id,
    CASE
        WHEN city = 'NYC' THEN 'New York'
        WHEN city = 'SF' THEN 'San Francisco'
        ELSE city
    END AS normalized_city
FROM customers;
```

This is often used in ETL jobs to clean and normalize source values.

---

## 10. Common business rule examples

Typical business rules implemented with `CASE` include:

- customer segmentation
- sales region classification
- fraud flagging
- late shipment labeling
- risk scoring buckets
- coupon eligibility

Example:

```sql
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount > 500 THEN 'High Value'
        WHEN total_amount > 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_bucket
FROM orders;
```

---

## 11. CASE and data quality checks

You can also use `CASE` to flag suspicious or invalid data.

```sql
SELECT
    order_id,
    CASE
        WHEN total_amount < 0 THEN 'Invalid amount'
        WHEN status IS NULL THEN 'Missing status'
        ELSE 'Valid'
    END AS data_quality_flag
FROM orders;
```

This is very useful for validation and monitoring in real pipelines.

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- write a simple `CASE` expression
- use multiple `WHEN` conditions
- use `CASE` with aggregation
- classify rows into business buckets
- handle `NULL` values inside `CASE`
- apply `CASE` to ETL and reporting logic

---

## 13. Practice prompts

Try solving these with CASE logic:

- classify customers as VIP, Gold, or Standard
- label orders as small, medium, or large
- flag invalid or missing values in a data quality query
- calculate paid vs cancelled revenue in one query
- map raw product categories to normalized business categories

These patterns are extremely common in real data engineering work.
