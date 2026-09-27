# LAG and LEAD in SQL

## 1. Why LAG and LEAD matter

`LAG()` and `LEAD()` are window functions that compare the current row with a previous or next row.

They are commonly used for:

- previous day or previous period analysis
- trend detection
- sales change analysis
- event sequencing
- anomaly detection

---

## 2. LAG

`LAG(column, n)` returns a value from a previous row in the window.

```sql
SELECT
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS previous_day_sales
FROM orders;
```

This is useful when comparing a row to the one before it.

---

## 3. LEAD

`LEAD(column, n)` returns a value from a following row.

```sql
SELECT
    order_date,
    total_amount,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_day_sales
FROM orders;
```

This allows you to compare with the next row without writing a self-join.

---

## 4. Partitioning with LAG and LEAD

You can compare previous and next values within each group.

```sql
SELECT
    customer_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount
FROM orders;
```

This is useful for customer-wise behavior and sequential event analysis.

---

## 5. Change detection

LAG and LEAD help detect changes between time periods.

```sql
SELECT
    order_date,
    total_amount,
    total_amount - LAG(total_amount) OVER (ORDER BY order_date) AS delta_from_previous_day
FROM orders;
```

This calculates the difference between the current value and the previous value.

---

## 6. Common use cases

LAG and LEAD are used for:

- month-over-month comparisons
- daily growth analysis
- previous/next transaction analysis
- detecting anomalies
- customer progression over time
- session or event sequence work

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- use `LAG()` and `LEAD()` correctly
- compare rows across partitions and sequences
- calculate period-over-period changes
- explain why these functions are useful in analytics

---

## 8. Practice prompts

Try solving:

- revenue difference from previous day
- customer order gap between consecutive purchases
- next purchase date for each customer
- daily growth or decline in KPIs
- detection of unusual spikes or drops in performance

LAG and LEAD are essential for time-series analysis and trend comparisons.
