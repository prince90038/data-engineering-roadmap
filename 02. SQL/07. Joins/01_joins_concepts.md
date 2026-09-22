# Joins in SQL

## 1. Why joins matter

Joins are one of the most important concepts in SQL because they allow you to combine data from multiple tables.

In data engineering, joins are used to:

- connect customer and order data
- combine fact and dimension tables
- enrich raw data with reference data
- create analytical datasets
- answer business questions across tables

Without joins, SQL would be limited to working with one table at a time.

---

## 2. The basic idea

A join combines rows from two or more tables based on a related column, usually a primary key and a foreign key.

Example:

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
```

This returns rows where the customer and order records match.

---

## 3. INNER JOIN

`INNER JOIN` returns only matching rows from both tables.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
```

This is the most common join type.

---

## 4. LEFT JOIN

`LEFT JOIN` returns all rows from the left table, and matching rows from the right table.

If no match exists on the right, NULL values are returned.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
```

This is useful when you want to see all customers, even those without orders.

---

## 5. RIGHT JOIN

`RIGHT JOIN` returns all rows from the right table and matching rows from the left table.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;
```

This is less common than `LEFT JOIN`, but it is useful in some analytical cases.

---

## 6. FULL OUTER JOIN

`FULL OUTER JOIN` returns all rows from both tables.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;
```

This is useful when you need to compare both tables and see unmatched records on either side.

---

## 7. CROSS JOIN

`CROSS JOIN` produces a Cartesian product: every row in the left table is paired with every row in the right table.

```sql
SELECT c.customer_id, p.product_id
FROM customers c
CROSS JOIN products p;
```

This can create a very large result set, so use it carefully.

---

## 8. SELF JOIN

A self join joins a table to itself.

This is useful when a table stores hierarchical or related records.

```sql
SELECT
    e.employee_id,
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;
```

This allows you to connect employees to their managers.

---

## 9. Join conditions

The join condition tells SQL how rows from both tables match.

Typical join conditions:

```sql
ON c.customer_id = o.customer_id
ON e.department_id = d.department_id
ON a.user_id = b.user_id
```

This is usually based on:

- primary key to foreign key
- business keys
- surrogate keys
- matching IDs or codes

---

## 10. Join cardinality

Join cardinality refers to how many matching rows appear on each side of a join.

Common patterns:

- one-to-one
- one-to-many
- many-to-many

Example:

- one customer to many orders → one-to-many
- one order to one payment → one-to-one
- many products to many categories → many-to-many, often solved using a bridge table

Understanding cardinality helps explain why joins can multiply row counts.

---

## 11. Duplicate join keys

If one or both tables have duplicate join keys, the result set can grow unexpectedly.

Example:

```sql
SELECT *
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
```

If a customer has multiple orders, you get multiple matching rows.

This is normal, but it can surprise beginners.

---

## 12. Unmatched records

To find rows that do not match:

```sql
SELECT c.*
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

This finds customers with no orders.

Similarly, you can find orders with no matching customer.

---

## 13. Multiple joins

You can join more than two tables in one query.

```sql
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    p.product_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;
```

This is common in data warehouse and reporting queries.

---

## 14. Common interview questions

Be ready to explain:

- what happens when join columns contain duplicates
- why joins can unexpectedly increase row count
- how to find unmatched records
- when to use `LEFT JOIN` instead of `INNER JOIN`
- how many-to-many relationships are handled

---

## 15. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between `INNER`, `LEFT`, `RIGHT`, and `FULL OUTER` joins
- write joins using primary and foreign keys
- identify unmatched rows
- handle duplicate join keys correctly
- reason about row multiplication in joins
- write queries that join more than two tables

---

## 16. Practice prompts

Try answering these with SQL:

- Which customers have no orders?
- How many orders did each customer place?
- Which products were sold in each order?
- Which departments have employees with no managers?
- Which records are missing from a join?

These are foundational questions in analytics and data engineering work.
