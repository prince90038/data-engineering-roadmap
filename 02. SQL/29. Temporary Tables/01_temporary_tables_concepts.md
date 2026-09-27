# Temporary Tables in SQL

## 1. What is a temporary table?

A temporary table is a table that exists only for the duration of a session or a transaction.

It is useful for:

- intermediate results
- staging data before transformation
- complex multi-step analytics
- reducing repeated subquery work

---

## 2. Why use temporary tables?

Sometimes a query becomes too complex to keep in one statement.

Temporary tables allow a developer to:

- break work into clear steps
- store intermediate data
- reuse results in multiple statements
- apply transformations progressively

This is especially useful in ETL and data processing workflows.

---

## 3. Temporary tables vs CTEs

A CTE is a query-level temporary result. It is good for readability and one-off logic.

A temporary table is better when:

- the result is reused many times
- the data is large
- the data needs to be indexed or filtered repeatedly
- the intermediate result should persist across statements

---

## 4. Scope and lifecycle

Temporary tables are usually scoped to:

- the current connection/session
- the current transaction, depending on the database

They disappear when the session ends or when explicitly dropped.

---

## 5. Typical use cases

Temporary tables are common in:

- data cleaning pipelines
- staging layers
- incremental ETL jobs
- debugging long queries
- preparing data for reporting

---

## 6. Staging tables

A staging table is a table used to hold raw or partially prepared data before final transformation.

This helps isolate ingestion logic from downstream business logic and improves traceability.

---

## 7. Performance considerations

Temporary tables can improve performance when a large intermediate result is referenced multiple times.

However, they also add overhead:

- storage usage
- creation time
- cleanup effort

They should be used intentionally, not as a default replacement for CTEs.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain what a temporary table is
- describe when temporary tables are helpful
- compare them with CTEs and views
- explain why staging is useful in ETL workflows

---

## 9. Practice prompts

Try solving:

- create a temporary summary table from orders and customers
- update a temporary table before final reporting
- explain why a temp table might outperform repeated subqueries
- decide whether a workflow should use a CTE or a temporary table

Temporary tables are a practical tool for breaking complex logic into manageable, reusable steps.
