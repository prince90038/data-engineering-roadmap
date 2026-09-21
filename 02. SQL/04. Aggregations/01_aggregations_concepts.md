# Aggregations in SQL

## 1. Why aggregation matters

Aggregation is the process of summarizing many rows into a single value or a smaller grouped result.

In data engineering, aggregation is used for:

- total revenue
- average order value
- customer counts
- daily transaction counts
- data quality checks
- dashboard metrics

Without aggregation, SQL queries often return too much raw data to be useful for reporting.

---

## 2. Core aggregate functions

The most common aggregate functions are:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

These functions reduce many rows into one summary value.

### COUNT()

`COUNT()` counts rows.

```sql
SELECT COUNT(*)
FROM orders;
```

This returns the total number of rows in the `orders` table.

### SUM()

`SUM()` adds numeric values.

```sql
SELECT SUM(total_amount)
FROM orders;
```

This gives the total sales value.

### AVG()

`AVG()` calculates the average value.

```sql
SELECT AVG(total_amount)
FROM orders;
```

This returns the average transaction amount.

### MIN() and MAX()

```sql
SELECT MIN(total_amount), MAX(total_amount)
FROM orders;
```

This gives the smallest and largest order value.

---

## 3. COUNT variations

There are a few common ways to use `COUNT()`:

### COUNT(*)

Counts every row, including rows with NULLs.

```sql
SELECT COUNT(*)
FROM customers;
```

### COUNT(column)

Counts non-NULL values in a specific column.

```sql
SELECT COUNT(email)
FROM customers;
```

### COUNT(DISTINCT column)

Counts unique non-NULL values.

```sql
SELECT COUNT(DISTINCT customer_id)
FROM orders;
```

This is often used to answer questions such as:

- how many unique customers placed orders?
- how many distinct products were sold?
- how many unique cities appear in a dataset?

---

## 4. Aggregates with filters

You can combine aggregation with a `WHERE` clause.

```sql
SELECT COUNT(*)
FROM orders
WHERE status = 'paid';
```

This counts only paid orders.

You can also calculate totals for a specific condition:

```sql
SELECT SUM(total_amount)
FROM orders
WHERE order_date >= '2025-02-01';
```

---

## 5. Aggregates and business questions

Aggregations are frequently used to answer business questions such as:

- Total sales for this month
- Average order value
- Number of active customers
- Unique customers who purchased last quarter
- Largest order amount
- Most recent order date

Examples:

```sql
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT AVG(total_amount) AS avg_order_value
FROM orders;

SELECT MAX(order_date) AS latest_order_date
FROM orders;
```

---

## 6. Common mistakes with aggregates

### 1. Forgetting NULL behavior

`COUNT(column)` ignores NULLs, while `COUNT(*)` counts all rows.

```sql
SELECT COUNT(*)
FROM customers;

SELECT COUNT(email)
FROM customers;
```

The second query may return fewer rows if some emails are missing.

### 2. Using aggregate functions without grouping

If you select a non-aggregated column alongside an aggregate, the query may be invalid or may return unexpected results depending on the database.

```sql
SELECT customer_id, SUM(total_amount)
FROM orders;
```

This is usually not what you want unless you are grouping by `customer_id`.

### 3. Confusing COUNT and SUM

- `COUNT()` counts rows
- `SUM()` adds values

These are not interchangeable.

---

## 7. Aggregation in real-world data engineering

In ETL and analytics workflows, aggregations are used to:

- summarize raw event data
- build daily KPI tables
- produce fact table metrics
- validate row counts and totals
- check data quality before reporting

For example, a daily sales table may be built with:

```sql
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS orders_count,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY DATE(order_date);
```

This is the foundation for reporting pipelines and business dashboards.

---

## 8. Key learning goals

By the end of this topic, you should be able to explain:

- what `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()` do
- when to use `COUNT(*)` vs `COUNT(column)`
- when `COUNT(DISTINCT ...)` is useful
- how aggregates help answer business questions
- why NULL handling matters in aggregation

---

## 9. Practice prompts

Try answering these questions using SQL:

- How many customers exist in the database?
- What is the average order amount?
- What is the highest total amount in the orders table?
- How many unique customers placed orders?
- What was the total revenue last month?
- How many orders were paid vs pending?

These are common interview and reporting questions in data engineering.
