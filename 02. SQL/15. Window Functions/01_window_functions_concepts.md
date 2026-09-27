# Window Functions in SQL

## 1. Why window functions matter

Window functions are one of the most important SQL topics for analytics and data engineering interviews.

They let you perform calculations across a set of rows related to the current row without collapsing the result set.

This is useful for:

- ranking rows
- cumulative totals
- rolling averages
- comparisons with previous or next rows
- deduplication
- cohort analysis

---

## 2. Basic syntax

Window functions use the `OVER()` clause.

```sql
SELECT
    customer_id,
    total_amount,
    SUM(total_amount) OVER () AS total_revenue
FROM orders;
```

The function is calculated across a window of rows, rather than reducing the result to a single row per group.

---

## 3. PARTITION BY

`PARTITION BY` splits the rows into groups before applying the function.

```sql
SELECT
    customer_id,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY customer_id) AS customer_total
FROM orders;
```

This gives a total per customer while still returning each order row.

---

## 4. ORDER BY

`ORDER BY` inside `OVER()` defines the row ordering within the window.

```sql
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
```

This creates a running total across time-ordered rows.

---

## 5. ROW_NUMBER, RANK, and DENSE_RANK

These functions assign ranking values.

```sql
SELECT
    employee_id,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn,
    RANK() OVER (ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;
```

Key differences:

- `ROW_NUMBER()` gives unique values to every row
- `RANK()` gives ties the same rank and skips numbers
- `DENSE_RANK()` gives ties the same rank without skipping numbers

---

## 6. NTILE

`NTILE(n)` divides rows into `n` roughly equal groups.

```sql
SELECT
    customer_id,
    total_amount,
    NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
FROM orders;
```

This is often used for segmentation and percentile-based reporting.

---

## 7. LAG and LEAD

These compare a row with the previous or next row.

```sql
SELECT
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS previous_day_sales,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_day_sales
FROM orders;
```

Useful for:

- previous period comparison
- day-over-day trends
- detecting changes
- time-series analysis

---

## 8. FIRST_VALUE and LAST_VALUE

These return the first or last value in the window.

```sql
SELECT
    customer_id,
    order_date,
    total_amount,
    FIRST_VALUE(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order_value
FROM orders;
```

Useful for finding baseline values or analyzing customer behavior over time.

---

## 9. Running totals and cumulative metrics

Window functions are ideal for cumulative calculations.

```sql
SELECT
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
```

This is often used in dashboards and KPI reporting.

---

## 10. Moving averages

```sql
SELECT
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_average_7d
FROM orders;
```

This computes a rolling average over a fixed number of rows.

---

## 11. Window frames

A window frame defines the subset of rows included in the calculation.

Common patterns:

- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`
- `ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING`
- `RANGE BETWEEN ...`

This matters when you want precise rolling or cumulative logic.

---

## 12. Window functions in data engineering

They are heavily used in:

- analytics queries
- customer retention analysis
- event flows
- deduplication
- SCD-type logic
- KPI tracking
- trend analysis

---

## 13. Key learning goals

By the end of this topic, you should be able to:

- describe the purpose of a window function
- use `PARTITION BY` and `ORDER BY` correctly
- compare `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
- use `LAG`, `LEAD`, `NTILE`, and cumulative aggregates
- explain rolling windows and moving averages
- identify when a window function is better than a grouped aggregate

---

## 14. Practice prompts

Try solving:

- top 3 paid employees per department
- running total of monthly revenue
- previous and next transaction values
- quartiles of customer spend
- deduplicate records using `ROW_NUMBER()`
- identify gaps or trend changes with `LAG` and `LEAD`

Window functions are one of the highest-value SQL skills in modern data engineering.
