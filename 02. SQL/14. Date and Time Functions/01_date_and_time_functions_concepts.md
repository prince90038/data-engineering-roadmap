# Date and Time Functions in SQL

## 1. Why date functions matter

Date and time functions are central to analytics, ETL, and data engineering. They help answer questions like:

- what happened today?
- how much revenue was generated last month?
- what is the rolling 7-day total?
- what is the customer tenure?
- how long did a process run?

These operations are common in reporting and pipeline monitoring.

---

## 2. Basic date and time values

Common SQL date types include:

- `DATE`
- `TIME`
- `TIMESTAMP`
- `TIMESTAMP WITH TIME ZONE`

Each database may handle timezone and precision a little differently.

---

## 3. CURRENT_DATE and CURRENT_TIMESTAMP

```sql
SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;
```

These are useful for deriving time-based reports and filtering by current date.

---

## 4. DATE_TRUNC and DATE_PART / EXTRACT

```sql
SELECT DATE_TRUNC('month', order_date) AS month_start;
SELECT EXTRACT(YEAR FROM order_date) AS order_year;
```

These functions are used to group data by date units such as day, month, week, or year.

---

## 5. INTERVALs

Intervals represent time durations.

```sql
SELECT CURRENT_DATE + INTERVAL '7 days';
SELECT CURRENT_DATE - INTERVAL '1 month';
```

This is useful for comparing periods such as last 7 days or previous month.

---

## 6. DATE_ADD and DATE_SUB

Different databases use different names for adding or subtracting time.

Examples:

```sql
SELECT order_date + INTERVAL '1 day';
SELECT order_date - INTERVAL '30 days';
```

These are common in systems that look back at recent events or create rolling windows.

---

## 7. Date filtering examples

```sql
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';
```

```sql
SELECT *
FROM orders
WHERE DATE_TRUNC('month', order_date) = DATE_TRUNC('month', CURRENT_DATE);
```

This helps build daily, weekly, and monthly trend queries.

---

## 8. Month-over-month and year-over-year analysis

Date functions allow you to compare periods easily:

```sql
SELECT
    DATE_TRUNC('month', order_date) AS month_start,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month_start;
```

This creates the foundation for time-series analysis and KPI reporting.

---

## 9. Customer tenure and processing duration

Date functions are also used for:

- customer age
- account tenure
- order processing latency
- pipeline run timestamps
- SLA tracking

Example:

```sql
SELECT
    customer_id,
    CURRENT_DATE - created_at AS days_since_signup
FROM customers;
```

---

## 10. Time zones

Timezone-aware timestamps are important in modern systems.

Some databases support:

- `TIMESTAMP WITH TIME ZONE`
- timezone conversion functions
- local time normalization

When working with global data, always confirm the time zone assumptions in the source data.

---

## 11. Common analytics use cases

Date functions are used in:

- daily sales rollups
- monthly revenue analysis
- previous-period comparisons
- quarter-to-date reporting
- retention analysis
- moving window metrics
- ETL job freshness checks

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- use `CURRENT_DATE` and `CURRENT_TIMESTAMP`
- group by day, month, and year
- calculate windows relative to today
- subtract or add intervals
- explain how time zones affect timestamps
- write date-based analytics queries

---

## 13. Practice prompts

Try solving:

- daily total revenue for the last 30 days
- monthly order count for the last 12 months
- previous-month comparison
- number of orders in the last 7 days
- customer tenure in days
- jobs that started late or ran longer than expected

Date functions are foundational for reporting and operational monitoring in data engineering.
