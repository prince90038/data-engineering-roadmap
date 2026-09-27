# Common Table Expressions (CTEs)

## 1. What is a CTE?

A Common Table Expression (CTE) is a temporary result set that you define within a query using `WITH`.

CTEs help you:

- break complex SQL into readable steps
- reuse intermediate results
- simplify nested logic
- make analytical queries easier to debug
- structure large queries in a modular way

They are especially popular in data engineering and analytics tasks.

---

## 2. Why use CTEs?

CTEs are useful when:

- a query has several transformation steps
- you want to reuse a result multiple times in one query
- a subquery is becoming hard to read
- you need to separate raw logic from final output

A well-written CTE often makes a query easier to maintain than a deeply nested statement.

---

## 3. Basic CTE syntax

```sql
WITH sales_summary AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM sales_summary
WHERE total_sales > 1000;
```

This creates a temporary result set called `sales_summary`, which is then queried like a table.

---

## 4. Multiple CTEs

You can define more than one CTE in a single query.

```sql
WITH customer_orders AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
),
high_value_customers AS (
    SELECT customer_id
    FROM customer_orders
    WHERE order_count > 3
)
SELECT c.*
FROM customers c
JOIN high_value_customers hvc
    ON c.customer_id = hvc.customer_id;
```

This is useful when you want to chain multiple stages of transformation.

---

## 5. Chained CTEs

CTEs can depend on earlier CTEs in the same query.

```sql
WITH order_totals AS (
    SELECT customer_id, SUM(total_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
),
customer_rankings AS (
    SELECT
        customer_id,
        total_spend,
        RANK() OVER (ORDER BY total_spend DESC) AS rnk
    FROM order_totals
)
SELECT *
FROM customer_rankings
WHERE rnk <= 5;
```

This pattern is common in ranking and reporting workflows.

---

## 6. Recursive CTEs

A recursive CTE repeatedly references itself until a stopping condition is reached.

```sql
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id, manager_id, employee_name, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.employee_name, eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
      ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;
```

Recursive CTEs are used for:

- hierarchical data
- organizational charts
- bill of materials
- tree traversal
- graph-like relationships

---

## 7. CTEs vs subqueries

CTEs and subqueries can solve similar problems, but CTEs are usually easier to read when the query is long or multi-step.

Use a CTE when:

- you are building a multi-step query
- the intermediate result is reused
- readability matters

Use a subquery when:

- the logic is compact and only needed once
- a single nested calculation is sufficient

---

## 8. CTEs vs temporary tables

A CTE is temporary within a single query, while a temporary table persists in the session or database for reuse.

Use a CTE when:

- the result is only needed for one statement
- you want simpler SQL

Use a temporary table when:

- the result is reused across multiple statements
- the dataset is large and needs to be persisted for debugging or further transformations

---

## 9. Readability and maintainability

CTEs help structure a query into logical stages, such as:

1. source filtering
2. transformations
3. aggregation
4. final selection

This makes query logic easier to review and debug.

For example:

```sql
WITH filtered_orders AS (
    SELECT *
    FROM orders
    WHERE order_date >= '2025-01-01'
),
aggregated_orders AS (
    SELECT customer_id, SUM(total_amount) AS total_spend
    FROM filtered_orders
    GROUP BY customer_id
)
SELECT *
FROM aggregated_orders
ORDER BY total_spend DESC;
```

This is much easier to reason about than a single giant query.

---

## 10. Performance considerations

CTEs are not automatically a performance optimization. They are mostly about readability.

Important points:

- a CTE may be materialized in some databases
- repeated references to a CTE can cause extra work
- recursive CTEs can be expensive if used carelessly
- the final query plan still matters

The best CTE is one that is clear and efficient, not just one that looks elegant.

---

## 11. Real-world data engineering use cases

CTEs are widely used in:

- ETL data transformations
- filtering and cleaning raw data
- metric preparation for dashboards
- customer cohort analysis
- path analysis and event sequencing
- recursive hierarchy processing
- validation queries before landing data in warehouse tables

---

## 12. Key learning goals

By the end of this topic, you should be able to:

- write a basic `WITH` query
- define multiple CTEs in one statement
- chain CTEs together logically
- understand recursive CTEs
- explain when CTEs are better than subqueries or temp tables
- use CTEs to improve readability and query structure

---

## 13. Practice prompts

Try solving:

- top customers by total spend using a CTE chain
- monthly sales aggregated in staged CTEs
- employee hierarchy with a recursive CTE
- customer retention analysis built in multiple CTEs
- deduplication plus ranking in one logical flow

CTEs are one of the most practical tools for building readable SQL in real-world Data Engineering workflows.
