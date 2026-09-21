# GROUP BY and HAVING in SQL

## 1. Why GROUP BY matters

`GROUP BY` is used when you want to aggregate data by one or more columns.

It lets you answer questions like:

- How much revenue did each customer generate?
- How many orders were placed per month?
- Which product category had the highest sales?
- Which departments have average salaries above a threshold?

This is one of the most important SQL patterns in analytics and reporting.

---

## 2. Basic GROUP BY

`GROUP BY` groups rows that share the same value in one or more columns.

```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;
```

This returns one row per customer, with the number of orders they placed.

---

## 3. GROUP BY with aggregate functions

Common aggregate functions used with `GROUP BY` are:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

Example:

```sql
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_spent,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id;
```

This gives a summary per customer.

---

## 4. WHERE vs HAVING

This is a very common SQL interview topic.

### WHERE

Use `WHERE` to filter rows before grouping.

```sql
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
WHERE status = 'paid'
GROUP BY customer_id;
```

This filters the rows before the aggregation happens.

### HAVING

Use `HAVING` to filter groups after aggregation.

```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;
```

This keeps only customer groups with more than two orders.

---

## 5. Multi-column grouping

You can group by more than one column.

```sql
SELECT
    customer_id,
    DATE(order_date) AS order_day,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id, DATE(order_date);
```

This gives one row per customer per day.

---

## 6. GROUP BY and reporting

`GROUP BY` is heavily used in dashboards and analytics queries.

Examples:

```sql
SELECT
    DATE(order_date) AS order_day,
    SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;
```

```sql
SELECT
    category,
    COUNT(*) AS product_count,
    AVG(price) AS avg_price
FROM products
GROUP BY category;
```

---

## 7. HAVING with aggregate conditions

`HAVING` is especially useful when filtering on grouped metrics.

```sql
SELECT
    category,
    AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 100;
```

This keeps only categories whose average product price is above a threshold.

---

## 8. Common mistakes

### 1. Using WHERE instead of HAVING for aggregate filters

This is wrong:

```sql
SELECT customer_id, COUNT(*)
FROM orders
WHERE COUNT(*) > 2
GROUP BY customer_id;
```

`COUNT(*)` is only available after grouping. Use `HAVING` instead.

### 2. Grouping by too many columns

If you group by too many fields, the result may become too granular and less useful.

### 3. Forgetting column selection rules

In SQL, any column in the `SELECT` list that is not part of an aggregate should usually be in the `GROUP BY` clause.

---

## 9. Real-world data engineering use cases

`GROUP BY` and `HAVING` are used for:

- sales by customer
- sales by month
- transaction counts by category
- active customer segments
- quality checks for anomalous groups
- KPI calculations in data warehouse queries

Examples:

```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
```

---

## 10. Key learning goals

By the end of this topic, you should understand:

- how `GROUP BY` changes row-level data into grouped summaries
- how aggregate functions work with grouped data
- the difference between `WHERE` and `HAVING`
- how to write grouped reports and KPI queries
- how to filter groups based on aggregate values

---

## 11. Practice prompts

Try answering these questions with SQL:

- Which customers placed the most orders?
- What is the monthly revenue per month?
- Which categories have more than 10 products?
- Which departments have an average salary above 90,000?
- Which customers spent more than $500 total?

These are standard SQL interview and analytics questions.
