# Running Totals and Window Frames

## 1. What is a running total?

A running total is a cumulative sum that accumulates values over time or in a sequence.

```sql
SELECT
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY order_date
    ) AS running_total
FROM orders;
```

This is often used in financial reporting, sales dashboards, and operational trend monitoring.

---

## 2. Why are window frames important?

A window frame defines exactly which rows are included in the calculation.

Without a frame, the default often becomes all rows from the start of the partition to the current row.

Example:

```sql
SUM(amount) OVER (
    ORDER BY date
)
```

This is a cumulative running total.

---

## 3. ROWS BETWEEN

`ROWS BETWEEN` is often used to specify an exact sliding window.

```sql
SELECT
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average_3d
FROM orders;
```

This computes the average using the current row and the previous two rows.

---

## 4. RANGE BETWEEN

`RANGE BETWEEN` uses logical ranges instead of physical row counts.

```sql
SUM(amount) OVER (
    ORDER BY order_date
    RANGE BETWEEN INTERVAL '7 days' PRECEDING AND CURRENT ROW
)
```

This is useful when you want date-based windows instead of a fixed number of rows.

---

## 5. Moving averages

A moving average helps smooth short-term fluctuations.

```sql
SELECT
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7d
FROM orders;
```

This is widely used in sales and operational reporting.

---

## 6. Cumulative counts and metrics

Window frames are not only for sums. They can also be used for counts, averages, min, max, and more.

```sql
SELECT
    customer_id,
    order_date,
    COUNT(*) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS cumulative_orders
FROM orders;
```

This shows the progression of a customer’s activity over time.

---

## 7. Default frame behavior

In many databases, the default window frame for an ordered aggregate is:

```sql
FROM start_of_partition TO current_row
```

This is why a simple `SUM(...) OVER (ORDER BY ...)` behaves like a running total.

---

## 8. Real-world use cases

Running totals and window frames are used for:

- cumulative revenue
- running inventory counts
- daily sales trends
- moving averages
- KPI rollups
- anomaly detection

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain running totals
- use `ROWS BETWEEN` and `RANGE BETWEEN`
- write a moving average query
- identify default cumulative behavior in window aggregates
- apply frame logic to business reporting queries

---

## 10. Practice prompts

Try solving:

- running monthly revenue by day
- cumulative orders by customer
- 7-day rolling sales average
- cumulative count of failed records per pipeline run
- month-to-date revenue comparison

This topic is essential for advanced analytics and KPI reporting in Data Engineering.
