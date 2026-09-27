# Conditional Aggregation in SQL

## 1. Why conditional aggregation matters

Conditional aggregation is the practice of aggregating rows based on whether they meet a condition.

It is commonly used for:

- success/failure counts
- percentages
- segmented reporting
- data quality summaries
- KPI rollups in a single query

---

## 2. Basic pattern

```sql
SELECT
    SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) AS successful_orders,
    SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) AS failed_orders
FROM orders;
```

This returns multiple counts from one table in a single query.

---

## 3. Why use CASE inside SUM

The `CASE` expression acts like a filter inside the aggregate function.

```sql
SUM(CASE WHEN condition THEN 1 ELSE 0 END)
```

This counts only rows satisfying the condition.

It is often more readable and efficient than writing multiple subqueries.

---

## 4. Conditional aggregation for percentages

```sql
SELECT
    SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) AS successful_orders,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS success_rate
FROM orders;
```

This is a common requirement in dashboards and business reports.

---

## 5. Multiple condition buckets

```sql
SELECT
    SUM(CASE WHEN amount < 100 THEN 1 ELSE 0 END) AS small_orders,
    SUM(CASE WHEN amount BETWEEN 100 AND 500 THEN 1 ELSE 0 END) AS medium_orders,
    SUM(CASE WHEN amount > 500 THEN 1 ELSE 0 END) AS large_orders
FROM orders;
```

This is useful for segmentation and operational reporting.

---

## 6. Conditional aggregation with groups

```sql
SELECT
    customer_id,
    SUM(CASE WHEN order_status = 'paid' THEN 1 ELSE 0 END) AS paid_orders,
    SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_orders
FROM orders
GROUP BY customer_id;
```

This gives a per-customer summary without needing separate aggregate queries.

---

## 7. Data quality reporting

Conditional aggregation is also used heavily in data quality checks.

```sql
SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_ids,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS missing_emails,
    COUNT(*) AS total_rows
FROM customers;
```

This makes it easy to summarize missing values for validation dashboards.

---

## 8. Common patterns

Typical use cases:

- successful vs failed transactions
- active vs inactive customers
- low, medium, high value ranges
- invalid vs valid records
- ratio metrics such as retention and conversion

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- write conditional aggregates using `CASE` inside `SUM`
- calculate success rates and business segmentation buckets
- summarize data quality metrics in a single query
- use conditional aggregation with `GROUP BY`

---

## 10. Practice prompts

Try solving:

- order success rate by month
- number of transactions in each amount bucket
- percentage of customers with active subscriptions
- count of bad records by validation rule
- daily conversion rates by channel

This is a very practical SQL pattern in reporting, metrics, and data quality work.
