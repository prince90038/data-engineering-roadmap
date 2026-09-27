# Views and Materialized Views in SQL

## 1. What is a view?

A view is a stored SQL query that behaves like a virtual table.

It does not store the result set permanently. Instead, it computes the result when queried.

This makes views useful for:

- simplifying complex queries
- controlling access to data
- reusing logic across reports
- hiding table complexity

---

## 2. Why use a view?

Views are commonly used to:

- present a simplified version of a table
- combine multiple tables into a readable object
- enforce access rules without duplicating data
- standardize reporting logic

Example:

```sql
CREATE VIEW recent_orders AS
SELECT order_id, customer_id, total_amount
FROM orders
WHERE order_date >= '2025-01-01';
```

---

## 3. Benefits of views

Benefits include:

- reusability
- security through abstraction
- readability
- consistent query logic across users

Views are especially helpful when the same joins or filters are needed often.

---

## 4. Limitations of views

Views do not store data physically.

That means they can be slower when the underlying query is expensive, because the data is recomputed each time the view is accessed.

---

## 5. What is a materialized view?

A materialized view stores the query result physically, like a cached table.

This makes reads faster for expensive aggregated queries or repeated reports.

The tradeoff is that the data can become stale until refreshed.

---

## 6. Materialized view refresh strategies

Common refresh strategies include:

- full refresh
- incremental refresh
- on-demand refresh
- scheduled refresh

The best approach depends on business requirements and data freshness.

---

## 7. When to use views vs materialized views

Use a regular view when:

- data should always reflect the latest state
- the query is not too expensive
- simplicity is more important than performance

Use a materialized view when:

- the result is expensive to compute
- the query is used frequently
- slight staleness is acceptable

---

## 8. Example use cases

Views are often used for:

- customer dashboards
- secure data access layers
- reusable reporting queries

Materialized views are often used for:

- aggregate daily sales summaries
- reporting tables refreshed at intervals
- expensive joins over large datasets

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain the purpose of a view
- explain the purpose of a materialized view
- identify when each should be used
- describe trade-offs between freshness and performance

---

## 10. Practice prompts

Try solving:

- create a view that joins customers and orders
- compare query performance between a view and a materialized view
- explain why a materialized view may be stale
- decide whether a reusable report should use a view or a materialized view

Views and materialized views are important tools for making SQL systems easier to use and faster to query.
