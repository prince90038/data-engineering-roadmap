# Subqueries in SQL

## 1. What is a subquery?

A subquery is a query nested inside another SQL statement. It can be used in:

- `SELECT`
- `FROM`
- `WHERE`
- `HAVING`
- `JOIN`

Subqueries are often used to break down logic into smaller, easier-to-read steps.

---

## 2. Why use subqueries?

Subqueries are useful when:

- you need a value calculated from another table
- you need to compare rows against grouped or aggregated results
- you want to filter based on a dynamic condition
- you want to isolate logic for readability

Sometimes a JOIN or CTE is clearer, and it is important to know when one is better than the other.

---

## 3. Scalar subqueries

A scalar subquery returns exactly one value.

```sql
SELECT
    customer_id,
    first_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS total_orders
FROM customers c;
```

This is useful when you want to attach a single aggregate result to each row in the outer query.

---

## 4. Single-row subqueries

A single-row subquery returns one row and one column.

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

This returns only employees whose salary is above the company average.

---

## 5. Multi-row subqueries

A multi-row subquery returns more than one value.

```sql
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
```

This is commonly used with `IN`, `NOT IN`, `ANY`, and `ALL`.

---

## 6. Correlated subqueries

A correlated subquery depends on the outer query row.

```sql
SELECT c.customer_id,
       c.first_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.total_amount > 500
);
```

The inner query runs once per customer row, which makes it valuable for row-by-row checks.

---

## 7. Subqueries in WHERE

Subqueries in `WHERE` are often used for filtering based on another table.

```sql
SELECT *
FROM products p
WHERE p.product_id IN (
    SELECT product_id
    FROM order_items
    WHERE quantity > 10
);
```

This pattern is common in reporting and data quality checks.

---

## 8. Subqueries in SELECT

A subquery in `SELECT` often returns a scalar value to enrich each row.

```sql
SELECT
    e.employee_id,
    e.employee_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.employee_id = e.employee_id
    ) AS order_count
FROM employees e;
```

This can be useful for summary metrics directly in a result set.

---

## 9. Subqueries in FROM

A subquery in `FROM` creates a derived table that you can query like a normal table.

```sql
SELECT *
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) customer_summary
WHERE order_count > 2;
```

This is helpful when you want to pre-aggregate data before joining or filtering.

---

## 10. Subqueries vs JOIN vs CTE

Subqueries are powerful, but not always the best tool.

Use a JOIN when:

- you want to combine rows from multiple tables directly
- the logic is naturally relational
- you need to avoid repeated scalar subqueries

Use a CTE when:

- the query is complex
- you want intermediate logical steps
- readability matters more than compactness

Use a subquery when:

- the logic is compact
- you need a value or filter derived from another table
- a single nested expression is enough

---

## 11. Common subquery patterns

### 1. Maximum value

```sql
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
```

### 2. Customers without orders

```sql
SELECT *
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

### 3. Top 3 departments by employee count

```sql
SELECT department_id, employee_count
FROM (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
) dept_counts
ORDER BY employee_count DESC
LIMIT 3;
```

---

## 12. Performance considerations

Subqueries can be less efficient than joins or CTEs when they are repeatedly executed for each row.

Watch for:

- correlated subqueries on large tables
- repeated scalar subqueries in SELECT lists
- subqueries that return large intermediate sets

In many cases, rewriting the logic as a join or a CTE improves readability and performance.

---

## 13. Real-world use cases

Subqueries are extremely common in analytics and data engineering:

- compare each customer against an average
- find customers with no recent orders
- find departments above target revenue
- rank products by sales relative to category average
- create derived tables for reporting
- validate business rules before loading data

---

## 14. Key learning goals

By the end of this topic, you should be able to:

- explain what a subquery is
- use subqueries in `SELECT`, `WHERE`, and `FROM`
- identify scalar, single-row, and multi-row subqueries
- understand correlated subqueries
- decide when a join, CTE, or subquery is clearer
- avoid common performance pitfalls

---

## 15. Practice prompts

Try solving:

- employees earning more than the department average
- customers who placed at least one order above the average order value
- products sold in more than 3 regions
- orders whose amount exceeds the overall median
- customers with no matching record in a dimension table

These are common Data Engineering interview questions and real-world business checks.
